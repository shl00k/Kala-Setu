import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:kala_setu/theme/color_tokens.dart';

import '../../state/listing/listing_cubit.dart';
import '../../state/listing/listing_state.dart';

class ListingImageStep extends StatelessWidget {
  final ListingState state;
  final String languageCode;

  const ListingImageStep({
    super.key,
    required this.state,
    required this.languageCode,
  });

  @override
  Widget build(BuildContext context) {
    final image = state.selectedImage;
    return SingleChildScrollView(
      child: Column(
        spacing: 24,
        children: [
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(minimumSize: Size(250, 48)),
                  onPressed: state.isLoading
                      ? null
                      : context.read<ListingCubit>().takePhoto,
                  child: Text(
                    'Camera',
                    style: Theme.of(context).textTheme.labelLarge!
                        .copyWith(color: ColorTokens.secondary96),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(250, 48)),
                  onPressed: state.isLoading
                      ? null
                      : context.read<ListingCubit>().pickImage,
                  child: Text(
                    'Gallery',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
          if (image != null && File(image.path).existsSync()) ...[
            if (state.product.originalImagePath.isNotEmpty &&
                state.product.originalImagePath != image.path &&
                File(state.product.originalImagePath).existsSync())
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      spacing: 8,
                      children: [
                        const Text('Original'),
                        const SizedBox(height: 6),
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: _RoundedImage(
                            path: state.product.originalImagePath,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      spacing: 8,
                      children: [
                        const Text('Studio result'),
                        const SizedBox(height: 6),
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: _RoundedImage(path: image.path),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            else
              SizedBox(
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: _RoundedImage(path: image.path),
                ),
              ),
          ] else
            const AspectRatio(
              aspectRatio: 1 / 1,
              child: Center(child: Text('No image selected')),
            ),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: image == null || state.isLoading
                  ? null
                  : context.read<ListingCubit>().enhanceImage,
              child: state.isLoading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        SizedBox(width: 10),
                        Text('Creating studio photo...'),
                      ],
                    )
                  : Text(
                      'Create studio photo',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
            ),
          ),

          if (state.studioBackground) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (state.backgroundRemoved)
                  Chip(
                    backgroundColor: ColorTokens.secondary96,
                    padding: .all(12),
                    shape: RoundedRectangleBorder(borderRadius: .circular(16)),
                    label: Text(
                      'Background cleaned',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                if (state.autoCropped)
                  Chip(
                    backgroundColor: ColorTokens.secondary96,
                    padding: .all(12),
                    shape: RoundedRectangleBorder(borderRadius: .circular(16)),
                    label: Text(
                      'Auto-cropped',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                if (state.lightingCorrected)
                  Chip(
                    backgroundColor: ColorTokens.secondary96,
                    padding: .all(12),
                    shape: RoundedRectangleBorder(borderRadius: .circular(16)),
                    label: Text(
                      'Lighting corrected',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                Chip(
                  backgroundColor: ColorTokens.secondary96,
                  padding: .all(12),
                  shape: RoundedRectangleBorder(borderRadius: .circular(16)),
                  label: Text(
                    'Studio background',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ],
          if (state.imageAnalysis.isNotEmpty) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorTokens.secondary96,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text(
                    'AI image analysis',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  MarkdownBody(
                    data: state.imageAnalysis,
                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                        .copyWith(p: Theme.of(context).textTheme.bodyMedium),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _RoundedImage extends StatelessWidget {
  final String path;

  const _RoundedImage({required this.path});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.file(File(path), fit: BoxFit.cover),
    );
  }
}
