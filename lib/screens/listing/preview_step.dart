import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/listing/listing_cubit.dart';
import '../../state/listing/listing_state.dart';

class ListingPreviewStep extends StatelessWidget {
  final ListingState state;
  final String languageCode;

  const ListingPreviewStep({
    super.key,
    required this.state,
    required this.languageCode,
  });

  @override
  Widget build(BuildContext context) {
    final product = state.product;
    return SingleChildScrollView(
      scrollDirection: .vertical,
      child: Column(
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          if (product.imagePath.isNotEmpty &&
              File(product.imagePath).existsSync())
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(
                  File(product.imagePath),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          const SizedBox(height: 8),
          Text(product.title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(product.description),
          const Divider(),
          ...{
            'Category': product.category,
            'Material': product.material,
            'Design': product.design,
            'Type': product.type,
            'Color': product.color,
            'Length': product.length,
            'Width': product.width,
            'Weight': product.weight,
            'Craft technique': product.craftTechnique,
            'Keywords': product.keywords.join(', '),
          }.entries.map(
            (entry) =>
                ListTile(title: Text(entry.key), subtitle: Text(entry.value)),
          ),
          ListTile(
            title: const Text('Recommended price'),
            subtitle: Text('₹${product.recommendedPrice.toStringAsFixed(0)}'),
          ),
          SizedBox(
            height: 56,
            width: double.infinity,
            child: FilledButton(
              onPressed: state.isLoading
                  ? null
                  : context.read<ListingCubit>().saveProduct,
              child: const Text('Save listing offline + sync'),
            ),
          ),
          SizedBox(
            height: 56,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : context.read<ListingCubit>().publishToOndc,
              child: const Text('Publish to ONDC'),
            ),
          ),
          SizedBox(
            height: 56,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final payload = await context
                    .read<ListingCubit>()
                    .ondcPayload();
                if (!context.mounted) return;
                await showDialog<void>(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('ONDC seller payload'),
                    content: SingleChildScrollView(
                      child: SelectableText(payload),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('View normalized ONDC payload'),
            ),
          ),
        ],
      ),
    );
  }
}
