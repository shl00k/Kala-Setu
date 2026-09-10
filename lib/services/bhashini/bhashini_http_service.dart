import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/config/app_config.dart';
import '../../core/errors/app_exception.dart';
import 'bhashini_service.dart';

class BhashiniHttpService implements BhashiniService {
  final http.Client client;
  BhashiniHttpService({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<String> translate({required String text, required String source, required String target}) async {
    if (!AppConfig.hasBhashini) return text;

    // Bhashini ULCA uses a pipeline configuration step followed by a compute call.
    // The exact callback endpoint and service IDs are returned by your configured pipeline.
    // Keep those values server-side in production. This client is a PoC adapter.
    final configResponse = await client.post(
      Uri.parse('https://meity-auth.ulcacontrib.org/ulca/apis/v0/model/getModelsPipeline'),
      headers: {
        'Content-Type': 'application/json',
        'userID': AppConfig.bhashiniUserId,
        'ulcaApiKey': AppConfig.bhashiniApiKey,
      },
      body: jsonEncode({
        'pipelineTasks': [
          {
            'taskType': 'translation',
            'config': {
              'language': {
                'sourceLanguage': source,
                'targetLanguage': target,
              }
            }
          }
        ],
        'pipelineRequestConfig': {'pipelineId': AppConfig.bhashiniPipelineId},
      }),
    );

    if (configResponse.statusCode < 200 || configResponse.statusCode >= 300) {
      throw AppException('Bhashini configuration failed (${configResponse.statusCode}).');
    }

    // The pipeline compute endpoint is dynamically returned by Bhashini. We intentionally
    // do not hard-code a service URL here. For a hackathon, the fallback keeps the app usable.
    return text;
  }
}
