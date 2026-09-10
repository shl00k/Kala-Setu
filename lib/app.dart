import 'package:flutter/material.dart';

import 'screens/language/language_screen.dart';
import 'theme/app_theme.dart';

class KaalSetuApp extends StatelessWidget {
  const KaalSetuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'कला Setu',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightModeTheme,
      home: const LanguageScreen(),
    );
  }
}
