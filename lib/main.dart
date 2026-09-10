import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/config/app_config.dart';
import 'core/di/service_locator.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  debugPrint(
    '=== Kala Setu App initialized ===\nSupabase Config: ${AppConfig.hasSupabase}\nGemini Config: ${AppConfig.hasGemini}\nBhashini Config: ${AppConfig.hasBhashini}',
  );

  if (AppConfig.hasSupabase) {
    await Supabase.initialize(
      url: AppConfig.supabaseUrl,
      publishableKey: AppConfig.supabasePublishableKey,
    );
  }

  setupDependencies();
  runApp(const KaalSetuApp());
}
