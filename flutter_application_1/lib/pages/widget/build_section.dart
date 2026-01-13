import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/product/all_product.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/models/store.dart';
import 'package:flutter_application_1/pages/product_desc_page.dart';
import 'package:flutter_application_1/pages/widget/shortcut.dart';
import 'package:flutter_application_1/data/user.dart';

Widget buildProductCard(Product product, BuildContext context) {
  final store = getStoreById(product.storeId); // 👈 THIS LINE

  return GestureDetector(
    onTap: () {
      pushNav(context, ProductDescPage(product: product));
    },
    child: Container(
      width: 180,
      margin: const EdgeInsets.only(right: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                product.coverImage,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.category.label),
                    Text(
                      product.title,
                      maxLines: 2,
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: store.storeImage == null
                              ? Colors.grey.shade400
                              : null,
                          backgroundImage: store.storeImage != null
                              ? AssetImage(store.storeImage!)
                              : null,
                          child: store.storeImage == null
                              ? const Icon(
                                  Icons.store,
                                  size: 14,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            store.storeName,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Text('\$${product.price}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildMoreCard(BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 170,
      margin: EdgeInsets.only(right: 12),
      child: Card(
        color: Colors.grey.shade200,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_forward, size: 34),
              SizedBox(height: 8),
              Text('More', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    ),
  );
}

class BuildRowSection extends StatelessWidget {
  const BuildRowSection({
    super.key,
    this.title,
    required this.products,
    this.showMore = false,
  });
  final String? title;
  final List<Product> products;
  final bool showMore;
  @override
  Widget build(BuildContext context) {
    //String title;
    //ProductCategory? category;
    //int? limit;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Center(
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8,
                ),
              ),
            ),
          ),

        SizedBox(
          height: 245, // REQUIRED for horizontal list
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: showMore ? products.length + 1 : products.length,
            itemBuilder: (context, index) {
              if (showMore && index == products.length) {
                return buildMoreCard(context);
              }

              return buildProductCard(products[index], context);
            },
          ),
        ),
      ],
    );
  }
}

/*
Widget buildSection({
  required String title,
  ProductCategory? category,
  int? limit,
}) {
  Iterable<Product> filtered = category == null
      ? products
      : products.where((p) => p.category == category);

  final List<Product> displayProducts = limit == null
      ? filtered.toList()
      : filtered.take(limit).toList();

      final List<Product> productC = creato

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 8,
            ),
          ),
        ),
      ),

      SizedBox(
        height: 260, // REQUIRED for horizontal list
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          itemCount: displayProducts.length + 1,
          itemBuilder: (context, index) {
            if (index == displayProducts.length) {
              return buildMoreCard(context);
            }
            final product = displayProducts[index];

            return buildProductCard(product);
          },
        ),
      ),
    ],
  );
}
*/
