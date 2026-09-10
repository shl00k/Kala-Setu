import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kala_setu/theme/color_tokens.dart';

import '../../core/di/service_locator.dart';
import '../../state/products/products_cubit.dart';
import '../../models/product.dart';

class ProductsScreen extends StatelessWidget {
  final String languageCode;
  const ProductsScreen({super.key, this.languageCode = 'en'});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsCubit>()..load(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Products'),
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () => context.read<ProductsCubit>().sync(),
                icon: const Icon(Icons.sync, color: ColorTokens.primary50),
              ),
            ),
          ],
        ),
        body: BlocBuilder<ProductsCubit, List<Product>>(
          builder: (context, products) {
            if (products.isEmpty) {
              return const Center(child: Text('No saved listings yet.'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (_, index) {
                final p = products[index];
                final path = p.imagePath;
                return Card(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.only(bottom: 16),
                  color: ColorTokens.secondary96,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: path.isNotEmpty
                            ? Image.file(
                                File(path),
                                fit: BoxFit.cover,
                                cacheWidth: 800,
                                errorBuilder: (_, _, _) => const Center(
                                  child: Icon(Icons.image, size: 40),
                                ),
                              )
                            : const Center(child: Icon(Icons.image, size: 40)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '₹${p.recommendedPrice.toStringAsFixed(0)} • ${p.synced ? 'Synced' : 'Offline'}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              tooltip: 'Delete listing',
                              onPressed: () =>
                                  context.read<ProductsCubit>().delete(p.id),
                              icon: const Icon(
                                Icons.delete_outline,
                                color: ColorTokens.danger,
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
          },
        ),
      ),
    );
  }
}
