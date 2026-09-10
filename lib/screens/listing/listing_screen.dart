import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/service_locator.dart';
import '../../core/localization/app_locales.dart';
import '../../state/listing/listing_cubit.dart';
import '../../state/listing/listing_state.dart';
import '../../theme/color_tokens.dart';
import 'description_step.dart';
import 'image_step.dart';
import 'pricing_step.dart';
import 'preview_step.dart';

class ListingScreen extends StatelessWidget {
  final String languageCode;

  const ListingScreen({super.key, this.languageCode = 'en'});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ListingCubit>(),
      child: _ListingView(languageCode: languageCode),
    );
  }
}

class _ListingView extends StatelessWidget {
  final String languageCode;

  const _ListingView({required this.languageCode});

  String t(String key) => AppStrings.text(key, languageCode);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListingCubit, ListingState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error!)));
        }
        if (state.status == ListingStatus.saved) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              content: Text(
                'Saved locally. Cloud sync is attempted automatically.',
                style: const TextStyle(color: ColorTokens.secondary96),
              ),
            ),
          );
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(t('createListing'))),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _stepLabel(t('enhance'), ListingStep.image, state.step),
                    _stepLabel(
                      t('describe'),
                      ListingStep.description,
                      state.step,
                    ),
                    _stepLabel(t('price'), ListingStep.pricing, state.step),
                    _stepLabel(t('preview'), ListingStep.preview, state.step),
                  ],
                ),
              ),
              const Divider(height: 1),
              if (state.isLoading) const LinearProgressIndicator(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 180),
                    switchInCurve: Curves.easeOutCubic,
                    switchOutCurve: Curves.easeOutCubic,
                    transitionBuilder: (child, animation) =>
                        FadeTransition(opacity: animation, child: child),
                    child: KeyedSubtree(
                      key: ValueKey(state.step),
                      child: switch (state.step) {
                        ListingStep.image => ListingImageStep(
                          state: state,
                          languageCode: languageCode,
                        ),
                        ListingStep.description => ListingDescriptionStep(
                          state: state,
                          languageCode: languageCode,
                        ),
                        ListingStep.pricing => ListingPricingStep(
                          state: state,
                          languageCode: languageCode,
                        ),
                        ListingStep.preview => ListingPreviewStep(
                          state: state,
                          languageCode: languageCode,
                        ),
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: .circular(16),
                        ),
                      ),
                      onPressed:
                          state.step == ListingStep.image || state.isLoading
                          ? null
                          : context.read<ListingCubit>().previousStep,
                      child: Text(
                        'Back',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    if (state.step != ListingStep.preview)
                      ElevatedButton(
                        onPressed: state.isLoading
                            ? null
                            : context.read<ListingCubit>().nextStep,
                        child: Text(
                          'Next',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _stepLabel(String text, ListingStep target, ListingStep current) =>
      Text(
        text,
        style: TextStyle(fontWeight: target == current ? .w600 : .w400),
      );
}
