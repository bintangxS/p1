import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/product/all_product.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/widget/build_collumn_section.dart';
import 'package:flutter_application_1/pages/widget/shortcut.dart';
import 'package:flutter_application_1/pages/widget/appbar.dart';
import 'package:flutter_application_1/pages/widget/widget_tree.dart';

enum SortType { none, popular, datenew, dateold, pricelow, pricehigh }

class ProductSearchPage extends StatefulWidget {
  final ProductCategory productCategory;
  const ProductSearchPage({super.key, required this.productCategory});

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  int page = 1;
  final int limit = 4;
  late final ValueNotifier<SortType> sortType;

  @override
  void initState() {
    super.initState();
    sortType = ValueNotifier(SortType.none);
  }

  @override
  void dispose() {
    sortType.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productCategory = widget.productCategory;

    return Scaffold(
      appBar: Appbar1(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: Column(
          children: [
            /// BREADCRUMB
            Row(
              children: [
                GestureDetector(
                  onTap: () => pushNav(context, WidgetTree()),
                  child: const Text('Home >'),
                ),
                const SizedBox(width: 5),
                Text(productCategory.label),
              ],
            ),

            const SizedBox(height: 10),

            /// HEADER ROW
            Row(
              children: [
                Text(
                  ProductRepository.byCategory(
                    productCategory,
                  ).length.toString(),
                ),
                const Text(' Product'),
                const Spacer(),
                InkWell(
                  onTap: () => _showSortDialog(context),
                  child: Row(
                    children: const [
                      Icon(Icons.sort),
                      SizedBox(width: 4),
                      Text('Sort'),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// PRODUCTS + PAGINATION
            ValueListenableBuilder<SortType>(
              valueListenable: sortType,
              builder: (context, value, _) {
                List<Product> products = List.from(
                  ProductRepository.byCategory(productCategory),
                );

                /// SORT
                switch (value) {
                  case SortType.popular:
                    products.sort(
                      (a, b) => b.favoriteCount.compareTo(a.favoriteCount),
                    );
                    break;
                  case SortType.datenew:
                    products.sort((a, b) => b.createdAt.compareTo(a.createdAt));
                    break;
                  case SortType.dateold:
                    products.sort((a, b) => a.createdAt.compareTo(b.createdAt));
                    break;
                  case SortType.pricelow:
                    products.sort((a, b) => a.price.compareTo(b.price));
                    break;
                  case SortType.pricehigh:
                    products.sort((a, b) => b.price.compareTo(a.price));
                    break;
                  case SortType.none:
                    break;
                }

                final totalPages = (products.length / limit).ceil();

                if (page > totalPages) page = totalPages;
                if (page < 1) page = 1;

                final offset = (page - 1) * limit;
                final paginatedProducts = products
                    .skip(offset)
                    .take(limit)
                    .toList();

                return Column(
                  children: [
                    BuildCollumnSection(products: paginatedProducts),

                    const SizedBox(height: 10),

                    /// PAGINATION
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: page > 1
                              ? () => setState(() => page--)
                              : null,
                        ),

                        for (int i = 1; i <= totalPages; i++)
                          TextButton(
                            onPressed: () => setState(() => page = i),
                            child: Text(
                              i.toString(),
                              style: TextStyle(
                                fontWeight: page == i
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),

                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          onPressed: page < totalPages
                              ? () => setState(() => page++)
                              : null,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// SORT DIALOG
  void _showSortDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Sort by'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _sortItem('Popular', SortType.popular),
            _sortItem('Date: New to old', SortType.datenew),
            _sortItem('Date: Old to new', SortType.dateold),
            _sortItem('Price: Low to high', SortType.pricelow),
            _sortItem('Price: High to low', SortType.pricehigh),
          ],
        ),
      ),
    );
  }

  Widget _sortItem(String label, SortType type) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() => page = 1);
            sortType.value = type;
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(label),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
