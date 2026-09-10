import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/listing/listing_cubit.dart';
import '../../state/listing/listing_state.dart';

class ListingPricingStep extends StatefulWidget {
  final ListingState state;
  final String languageCode;

  const ListingPricingStep({
    super.key,
    required this.state,
    required this.languageCode,
  });

  @override
  State<ListingPricingStep> createState() => _ListingPricingStepState();
}

class _ListingPricingStepState extends State<ListingPricingStep> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _recommendationKey = GlobalKey();
  late final TextEditingController material;
  late final TextEditingController labour;
  late final TextEditingController margin;
  late final TextEditingController median;
  late final TextEditingController samples;

  @override
  void initState() {
    super.initState();
    material = TextEditingController(
      text: widget.state.product.materialCost.toString(),
    );
    labour = TextEditingController(
      text: widget.state.product.labourCost.toString(),
    );
    margin = TextEditingController(
      text: widget.state.product.margin.toString(),
    );
    median = TextEditingController(
      text: widget.state.product.marketMedian == 0
          ? ''
          : widget.state.product.marketMedian.toString(),
    );
    samples = TextEditingController(text: '0');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    for (final controller in [material, labour, margin, median, samples]) {
      controller.dispose();
    }
    super.dispose();
  }

  double _d(TextEditingController controller) =>
      double.tryParse(controller.text.trim()) ?? 0;

  int _i(TextEditingController controller) =>
      int.tryParse(controller.text.trim()) ?? 0;

  void _calculatePrice(BuildContext context) {
    context.read<ListingCubit>().calculatePrice(
      materialCost: _d(material),
      labourCost: _d(labour),
      marginPercent: _d(margin),
      marketMedian: _d(median) <= 0 ? null : _d(median),
      marketSamples: _i(samples),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final recommendationContext = _recommendationKey.currentContext;
      if (recommendationContext == null) return;
      Scrollable.ensureVisible(
        recommendationContext,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.state.product;
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        spacing: 16,
        children: [
          // const Text('Hybrid pricing assistant'),
          // const Text(
          //   'The engine protects your cost floor, then blends available market evidence with your margin.',
          // ),
          const SizedBox(height: 8),
          _numberField(material, 'Material cost (₹)'),
          _numberField(labour, 'Labour cost (₹)'),
          _numberField(margin, 'Desired margin (%)'),
          _numberField(median, 'Comparable market median (optional ₹)'),
          _numberField(samples, 'Comparable listing count'),
          SizedBox(
            height: 56,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final category = widget.state.product.category;
                if (category.trim().isEmpty) return;
                final value = await context
                    .read<ListingCubit>()
                    .loadMarketMedian(category);
                if (!context.mounted) return;
                if (value != null) median.text = value.toStringAsFixed(0);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      value == null
                          ? 'No market data available; using cost-based pricing.'
                          : 'Market median loaded: ₹${value.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                );
              },
              child: Text(
                'Load market median from Supabase',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          SizedBox(
            height: 56,
            width: double.infinity,
            child: FilledButton(
              onPressed: () => _calculatePrice(context),
              child: const Text('Calculate price'),
            ),
          ),

          if (product.recommendedPrice > 0) ...[
            KeyedSubtree(
              key: _recommendationKey,
              child: Column(
                spacing: 8,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Recommended: ₹${product.recommendedPrice.toStringAsFixed(0)}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Confidence: ${product.pricingConfidence}',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    product.pricingRationale,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _numberField(TextEditingController controller, String label) =>
      TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(borderRadius: .all(.circular(16))),
        ),
      );
}
