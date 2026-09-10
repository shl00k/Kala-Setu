import 'package:flutter/material.dart';
import 'package:kala_setu/theme/color_tokens.dart';
import 'package:kala_setu/theme/text_tokens.dart';

class TypoTheme {
  static const String fontfamily = 'Poppins';

  static TextTheme typo =
      TextTheme(
        displayLarge: TextTokens.displayLarge,
        displayMedium: TextTokens.displayMedium,
        displaySmall: TextTokens.displaySmall,
        headlineLarge: TextTokens.headingLarge,
        headlineMedium: TextTokens.headingMedium,
        headlineSmall: TextTokens.headingSmall,
        titleLarge: TextTokens.titleLarge,
        titleMedium: TextTokens.titleMedium,
        titleSmall: TextTokens.titleSmall,
        bodyLarge: TextTokens.bodyLarge,
        bodyMedium: TextTokens.bodyMedium,
        bodySmall: TextTokens.bodySmall,
        labelLarge: TextTokens.labelLarge,
        labelMedium: TextTokens.labelMedium,
        labelSmall: TextTokens.labelSmall,
      ).apply(
        fontFamily: fontfamily,
        bodyColor: ColorTokens.secondary03,
        displayColor: ColorTokens.secondary03,
      );
}
