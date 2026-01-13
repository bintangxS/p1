import 'package:flutter_application_1/models/product.dart';

import 'product_novel.dart';
import 'product_manga.dart';
import 'product_illustration.dart';
import 'product_music.dart';

class ProductRepository {
  static final List<Product> allProducts = [
    ...novelproducts,
    ...mangaproducts,
    ...musicproducts,
    ...illustrationproducts,
  ];

  static List<Product> all({int? limit, bool newestFirst = true}) {
    if (limit == null) return List.from(allProducts);
    return allProducts.take(limit).toList();
  }

  static List<Product> byCategory(
    ProductCategory category, {
    int? limit,
    bool newestFirst = true,
  }) {
    final filtered = allProducts.where((p) => p.category == category).toList();

    filtered.sort(
      (a, b) => newestFirst
          ? b.createdAt.compareTo(a.createdAt)
          : a.createdAt.compareTo(b.createdAt),
    );
    return limit == null ? filtered : filtered.take(limit).toList();
  }

  static List<Product> byStoreId(
    String storeId, {
    int? limit,
    bool newestFirst = true,
  }) {
    final filtered = allProducts.where((p) => p.storeId == storeId).toList();

    filtered.sort(
      (a, b) => newestFirst
          ? b.createdAt.compareTo(a.createdAt)
          : a.createdAt.compareTo(b.createdAt),
    );

    return limit == null ? filtered : filtered.take(limit).toList();
  }

  static List<Product> newest({int limit = 10}) {
    final sorted = [...allProducts]
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return sorted.take(limit).toList();
  }
}
