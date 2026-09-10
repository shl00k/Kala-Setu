import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/config/app_config.dart';
import '../../core/errors/app_exception.dart';
import '../../models/product.dart';
import 'ai_service.dart';

class GeminiAiService implements AiService {
  final http.Client client;
  GeminiAiService({http.Client? client}) : client = client ?? http.Client();

  static const _endpoint =
      'https://generativelanguage.googleapis.com/v1beta/models';

  @override
  Future<Product> generateCatalog({
    required Product product,
    required String transcript,
    required String outputLanguage,
    File? image,
  }) async {
    if (!AppConfig.hasGemini) return _fallback(product, transcript);

    final parts = <Map<String, dynamic>>[
      {
        'text':
            '''You are an AI catalog assistant for Indian artisans.

Your job is to create an accurate e-commerce catalog from:
1. The artisan's description.
2. The product image.

IMPORTANT RULES:
- Use the image to identify visible product characteristics.
- Use the artisan description to understand material, craft process and intended use.
- Never invent measurements, weight, material, certification, origin or manufacturing details.
- If a physical attribute cannot be determined reliably, return an empty string.
- Keep the description professional but easy to understand.
- Do not make unsupported claims such as "premium", "100% authentic", "eco-friendly", "organic", "GI certified", etc.
- Create a concise SEO-friendly title.
- Create a useful e-commerce description.
- Generate relevant search keywords.
- The category should be a practical marketplace category.

Return JSON only.

Required JSON fields:
title
description
material
design
type
color
length
width
weight
craftTechnique
category
keywords

Language:
Generate title and description in $outputLanguage.

Artisan description:
$transcript''',
      },
    ];

    if (image != null && await image.exists()) {
      final bytes = await image.readAsBytes();
      if (bytes.length < 18 * 1024 * 1024) {
        parts.add({
          'inline_data': {
            'mime_type': _mimeType(image.path),
            'data': base64Encode(bytes),
          },
        });
      }
    }

    final schema = {
      'type': 'OBJECT',
      'properties': {
        'title': {'type': 'STRING'},
        'description': {'type': 'STRING'},
        'material': {'type': 'STRING'},
        'design': {'type': 'STRING'},
        'type': {'type': 'STRING'},
        'color': {'type': 'STRING'},
        'length': {'type': 'STRING'},
        'width': {'type': 'STRING'},
        'weight': {'type': 'STRING'},
        'craftTechnique': {'type': 'STRING'},
        'category': {'type': 'STRING'},
        'keywords': {
          'type': 'ARRAY',
          'items': {'type': 'STRING'},
        },
      },
      'required': ['title', 'description', 'keywords'],
    };

    final response = await client.post(
      Uri.parse('$_endpoint/${AppConfig.geminiModel}:generateContent'),
      headers: {
        'Content-Type': 'application/json',
        'x-goog-api-key': AppConfig.geminiApiKey,
      },
      body: jsonEncode({
        'contents': [
          {'parts': parts},
        ],
        'generationConfig': {
          'temperature': 0.2,
          'responseMimeType': 'application/json',
          'responseSchema': schema,
        },
      }),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw AppException('Gemini request failed (${response.statusCode}).');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final text = _extractText(body);
    final parsed = jsonDecode(text) as Map<String, dynamic>;

    return product.copyWith(
      title: _string(parsed['title'], product.title),
      description: _string(parsed['description'], product.description),
      material: _string(parsed['material'], product.material),
      design: _string(parsed['design'], product.design),
      type: _string(parsed['type'], product.type),
      color: _string(parsed['color'], product.color),
      length: _string(parsed['length'], product.length),
      width: _string(parsed['width'], product.width),
      weight: _string(parsed['weight'], product.weight),
      craftTechnique: _string(parsed['craftTechnique'], product.craftTechnique),
      category: _string(parsed['category'], product.category),
      keywords: parsed['keywords'] is List
          ? List<String>.from(parsed['keywords'] as List)
          : product.keywords,
      sourceLanguage: outputLanguage,
    );
  }

  @override
  Future<String> analyzeImage(File image) async {
    if (!AppConfig.hasGemini) {
      return 'Image enhancement plan: crop to product, improve exposure and present the item on a clean background.';
    }

    final bytes = await image.readAsBytes();
    final response = await client.post(
      Uri.parse('$_endpoint/${AppConfig.geminiModel}:generateContent'),
      headers: {
        'Content-Type': 'application/json',
        'x-goog-api-key': AppConfig.geminiApiKey,
      },
      body: jsonEncode({
        'contents': [
          {
            'parts': [
              {
                'text': 'Analyze this artisan product photo. Return a short enhancement plan describing background, crop, lighting and framing improvements. Do not identify people.',
              },
              {
                'inline_data': {
                  'mime_type': _mimeType(image.path),
                  'data': base64Encode(bytes),
                },
              },
            ],
          },
        ],
      }),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw AppException(
        'Gemini image analysis failed (${response.statusCode}).',
      );
    }
    return _extractText(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Product _fallback(Product p, String transcript) {
    final clean = transcript.trim();
    final first = clean.isEmpty
        ? 'Handcrafted Artisan Product'
        : clean.split(RegExp(r'[.!?]')).first.trim();
    return p.copyWith(
      title: first.isEmpty ? 'Handcrafted Artisan Product' : first,
      description: clean.isEmpty ? 'Handcrafted artisan product.' : clean,
      category: p.category.isEmpty ? 'Handicraft' : p.category,
      keywords: p.keywords.isEmpty
          ? ['handmade', 'artisan', 'craft']
          : p.keywords,
    );
  }

  String _extractText(Map<String, dynamic> body) {
    final candidates = body['candidates'];
    if (candidates is List && candidates.isNotEmpty) {
      final content = candidates.first['content'];
      if (content is Map<String, dynamic>) {
        final parts = content['parts'];
        if (parts is List) {
          return parts
              .whereType<Map<String, dynamic>>()
              .map((p) => p['text'])
              .whereType<String>()
              .join();
        }
      }
    }
    throw const AppException('Gemini returned no text.');
  }

  String _string(dynamic value, String fallback) =>
      value is String && value.trim().isNotEmpty ? value.trim() : fallback;

  String _mimeType(String path) {
    final lower = path.toLowerCase();
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.webp')) return 'image/webp';
    return 'image/jpeg';
  }
}
