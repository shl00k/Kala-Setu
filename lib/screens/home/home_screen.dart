import 'package:flutter/material.dart';
import 'package:kala_setu/screens/language/language_screen.dart';
import 'package:kala_setu/theme/color_tokens.dart';

import '../../core/di/service_locator.dart';
import '../../core/localization/app_locales.dart';
import '../../state/products/products_cubit.dart';
import '../listing/listing_screen.dart';
import '../products/products_screen.dart';

class HomeScreen extends StatefulWidget {
  final String languageCode;
  const HomeScreen({super.key, this.languageCode = 'en'});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ProductsCubit productsCubit;

  @override
  void initState() {
    super.initState();
    productsCubit = getIt<ProductsCubit>()..load();
  }

  @override
  void dispose() {
    productsCubit.close();
    super.dispose();
  }

  String t(String key) => AppStrings.text(key, widget.languageCode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/icon-transparent.png', height: 48),
        title: Text(t('app')),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LanguageScreen()),
              );
            },
            child: Row(
              spacing: 8,
              children: [
                Text(
                  widget.languageCode,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Icon(Icons.language),
              ],
            ),
          ),
        ],
        actionsPadding: .symmetric(horizontal: 16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: .center,
          spacing: 24,
          children: [
            Expanded(
              child: Column(
                spacing: 16,
                mainAxisAlignment: .center,
                children: [
                  const Text('AI-powered artisan business manager'),
                  StreamBuilder<int>(
                    stream: Stream.periodic(
                      const Duration(milliseconds: 400),
                      (_) => 0,
                    ),
                    builder: (_, _) => FutureBuilder<List<dynamic>>(
                      future: productsCubit.repository.getAll(),
                      builder: (_, snapshot) =>
                          Text('Local listings: ${snapshot.data?.length ?? 0}'),
                    ),
                  ),
                ],
              ),
            ),

            Column(
              spacing: 8,
              children: [
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorTokens.secondary93,
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ProductsScreen(languageCode: widget.languageCode),
                      ),
                    ),
                    child: Text(
                      t('myProducts'),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorTokens.secondary93,
                    ),
                    onPressed: () async {
                      await productsCubit.sync();
                      if (mounted) setState(() {});
                    },
                    child: Text(
                      'Sync pending listings',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ListingScreen(languageCode: widget.languageCode),
                        ),
                      );
                      if (mounted) setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: .center,
                      spacing: 16,
                      children: [
                        Icon(Icons.add, size: 24),
                        Text(
                          t('createListing'),
                          style: Theme.of(context).textTheme.labelLarge!
                              .copyWith(color: ColorTokens.secondary96),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
