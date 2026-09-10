import 'package:flutter/material.dart';
import 'package:kala_setu/theme/color_tokens.dart';
import 'package:kala_setu/theme/typo_theme.dart';

class AppTheme {
  static final ThemeData lightModeTheme = ThemeData.light().copyWith(
    textTheme: TypoTheme.typo,
    primaryTextTheme: TypoTheme.typo,

    scaffoldBackgroundColor: ColorTokens.secondary90,

    appBarTheme: AppBarTheme(
      titleTextStyle: TypoTheme.typo.titleMedium,
      backgroundColor: ColorTokens.secondary96,
      centerTitle: true,
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TypoTheme.typo.bodyMedium,
      helperStyle: TypoTheme.typo.bodySmall,
      errorStyle: TypoTheme.typo.bodySmall,
    ),
    listTileTheme: ListTileThemeData(
      titleTextStyle: TypoTheme.typo.bodyLarge,
      subtitleTextStyle: TypoTheme.typo.bodyMedium,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorTokens.secondary96,
        shape: RoundedRectangleBorder(borderRadius: .circular(16)),
        textStyle: TypoTheme.typo.labelLarge,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: .circular(16)),
        textStyle: TypoTheme.typo.labelLarge,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(textStyle: TypoTheme.typo.labelLarge),
    ),
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: TypoTheme.typo.bodyMedium,
    ),
    dialogTheme: DialogThemeData(
      titleTextStyle: TypoTheme.typo.titleLarge,
      contentTextStyle: TypoTheme.typo.bodyMedium,
    ),

    colorScheme: .fromSeed(seedColor: ColorTokens.primary50),
  );
}
