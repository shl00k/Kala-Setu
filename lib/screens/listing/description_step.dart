import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/listing/listing_cubit.dart';
import '../../state/listing/listing_state.dart';

class ListingDescriptionStep extends StatefulWidget {
  final ListingState state;
  final String languageCode;

  const ListingDescriptionStep({
    super.key,
    required this.state,
    required this.languageCode,
  });

  @override
  State<ListingDescriptionStep> createState() => _ListingDescriptionStepState();
}

class _ListingDescriptionStepState extends State<ListingDescriptionStep> {
  late final TextEditingController transcript;
  late final Map<String, TextEditingController> fields;

  @override
  void initState() {
    super.initState();
    transcript = TextEditingController(text: widget.state.transcript);
    fields = {
      'title': TextEditingController(text: widget.state.product.title),
      'material': TextEditingController(text: widget.state.product.material),
      'design': TextEditingController(text: widget.state.product.design),
      'type': TextEditingController(text: widget.state.product.type),
      'color': TextEditingController(text: widget.state.product.color),
      'length': TextEditingController(text: widget.state.product.length),
      'width': TextEditingController(text: widget.state.product.width),
      'weight': TextEditingController(text: widget.state.product.weight),
      'craftTechnique': TextEditingController(
        text: widget.state.product.craftTechnique,
      ),
      'category': TextEditingController(text: widget.state.product.category),
      'description': TextEditingController(
        text: widget.state.product.description,
      ),
    };
  }

  @override
  void didUpdateWidget(ListingDescriptionStep oldWidget) {
    super.didUpdateWidget(oldWidget);
    final product = widget.state.product;
    fields['title']!.text = product.title;
    fields['material']!.text = product.material;
    fields['design']!.text = product.design;
    fields['type']!.text = product.type;
    fields['color']!.text = product.color;
    fields['length']!.text = product.length;
    fields['width']!.text = product.width;
    fields['weight']!.text = product.weight;
    fields['craftTechnique']!.text = product.craftTechnique;
    fields['category']!.text = product.category;
    fields['description']!.text = product.description;
    transcript.text = widget.state.transcript;
  }

  @override
  void dispose() {
    transcript.dispose();
    for (final controller in fields.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void update(String key) {
    final product = widget.state.product.copyWith(
      title: fields['title']!.text,
      material: fields['material']!.text,
      design: fields['design']!.text,
      type: fields['type']!.text,
      color: fields['color']!.text,
      length: fields['length']!.text,
      width: fields['width']!.text,
      weight: fields['weight']!.text,
      craftTechnique: fields['craftTechnique']!.text,
      category: fields['category']!.text,
      description: fields['description']!.text,
    );
    context.read<ListingCubit>().updateProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 8,
        children: [
          const SizedBox(height: 8),
          TextField(
            controller: transcript,
            maxLines: 8,
            decoration: const InputDecoration(
              labelText: 'Transcript / description',
              border: OutlineInputBorder(
                borderRadius: .all(Radius.circular(16)),
              ),
            ),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                flex: 1,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: widget.state.isLoading
                      ? null
                      : () async {
                          await context.read<ListingCubit>().recordDescription(
                            language: widget.languageCode,
                          );
                          if (!context.mounted) return;
                          transcript.text = context
                              .read<ListingCubit>()
                              .state
                              .transcript;
                        },
                  child: const Text('Record'),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: widget.state.isLoading
                      ? null
                      : () {
                          context.read<ListingCubit>().updateProduct(
                            widget.state.product,
                          );
                          context.read<ListingCubit>().generateCatalog(
                            language: widget.languageCode,
                          );
                        },
                  child: widget.state.isLoading
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                'Generating catalog...',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      : const Text('Generate catalog'),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          ...fields.entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: entry.value,
                onChanged: (_) => update(entry.key),
                decoration: InputDecoration(
                  labelText: entry.key,
                  border: const OutlineInputBorder(
                    borderRadius: .all(.circular(16)),
                  ),
                  contentPadding: .all(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
