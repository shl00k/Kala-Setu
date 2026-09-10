import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kala_setu/theme/color_tokens.dart';

import '../../core/localization/app_locales.dart';
import '../../core/di/service_locator.dart';
import '../../state/language/language_cubit.dart';
import '../home/home_screen.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LanguageCubit>(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            // leading: Icon(Icons.language_rounded),
            title: Text(
              AppStrings.text(
                'selectLanguage',
                context.watch<LanguageCubit>().state,
              ),
            ),
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(24),
            itemCount: supportedLanguages.length,
            itemBuilder: (context, index) {
              final language = supportedLanguages[index];
              return GestureDetector(
                onTap: () {
                  context.read<LanguageCubit>().changeLanguage(language.code);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen(languageCode: language.code),
                    ),
                  );
                },
                child: Card(
                  color: ColorTokens.secondary96,
                  shape: RoundedRectangleBorder(borderRadius: .circular(16)),
                  child: ListTile(
                    title: Text(
                      language.nativeName,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    subtitle: Text(
                      language.name,
                      style: Theme.of(context).textTheme.bodySmall!
                          .copyWith(color: ColorTokens.secondary50),
                    ),
                  ),
                  //   child: ListTile(
                  //     title: Text(
                  //       language.nativeName,
                  //       style: Theme.of(context).textTheme.titleSmall,
                  //     ),
                  //     subtitle: Text(
                  //       language.name,
                  //       style: Theme.of(context).textTheme.bodySmall!
                  //           .copyWith(color: ColorTokens.secondary50),
                  //     ),
                  //     onTap: () {
                  //       context.read<LanguageCubit>().changeLanguage(language.code);
                  //       Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (_) => HomeScreen(languageCode: language.code),
                  //         ),
                  //       );
                  //     },
                  //   ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
