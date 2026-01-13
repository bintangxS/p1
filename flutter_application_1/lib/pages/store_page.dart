import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/product/all_product.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/models/store.dart';
import 'package:flutter_application_1/pages/widget/appbar.dart';
import 'package:flutter_application_1/pages/widget/build_collumn_section.dart';

enum SortType { none, popular, date, price }

class StorePage extends StatefulWidget {
  final String storeId;
  const StorePage({super.key, required this.storeId});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late final ValueNotifier<SortType> sorttype;
  late final ValueNotifier<bool> cheapestFirst;
  late final ValueNotifier<bool> olderFirst;
  ProductCategory? selectedCategory;

  @override
  void initState() {
    super.initState();
    sorttype = ValueNotifier(SortType.none);
    cheapestFirst = ValueNotifier(true);
    olderFirst = ValueNotifier(false);
  }

  @override
  void dispose() {
    sorttype.dispose();
    cheapestFirst.dispose();
    olderFirst.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storeProducts = ProductRepository.byStoreId(widget.storeId);

    final store = getStoreById(widget.storeId);
    final availableCategories = storeProducts
        .map((p) => p.category)
        .toSet()
        .toList();

    return Scaffold(
      appBar: Appbar1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  store.bannerImage.toString(),
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.95),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            store.storeImage.toString(),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    store.storeName,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),

                              ///SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 25,
                                  ),
                                  Text(
                                    store.rating.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.add, color: Colors.white),
                              Text(
                                'Follow',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                store.storeBio.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => sorttype.value = SortType.popular,
                  child: Text('Populer'),
                ),
                ValueListenableBuilder(
                  valueListenable: olderFirst,
                  builder: (context, value, child) {
                    return InkWell(
                      onTap: () {
                        olderFirst.value = !olderFirst.value;
                        sorttype.value = SortType.date;
                      },
                      child: Row(
                        children: [
                          Text('Date'),
                          Icon(
                            olderFirst.value
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Category'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text('All Product'),
                              onTap: () {
                                setState(() {
                                  selectedCategory = null;
                                  sorttype.value = SortType.none;
                                });
                                Navigator.pop(context);
                              },
                            ),
                            ...availableCategories.map((cat) {
                              return ListTile(
                                title: Text(cat.label),
                                onTap: () {
                                  setState(() {
                                    selectedCategory = cat;
                                    sorttype.value = SortType.none;
                                  });
                                  Navigator.pop(context);
                                },
                              );
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text('Category'),
                ),
                ValueListenableBuilder(
                  valueListenable: cheapestFirst,
                  builder: (context, value, child) {
                    return InkWell(
                      onTap: () {
                        cheapestFirst.value = !cheapestFirst.value;
                        sorttype.value = SortType.price;
                      },
                      child: Row(
                        children: [
                          Text('Price'),
                          Icon(
                            cheapestFirst.value
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder<SortType>(
                valueListenable: sorttype,
                builder: (_, value, _) {
                  List<Product> products = [...storeProducts];

                  if (selectedCategory != null) {
                    products = products
                        .where((p) => p.category == selectedCategory)
                        .toList();
                  }

                  switch (value) {
                    case SortType.popular:
                      products.sort(
                        (a, b) => b.favoriteCount.compareTo(a.favoriteCount),
                      );
                      break;

                    case SortType.date:
                      products.sort(
                        (a, b) => olderFirst.value
                            ? a.createdAt.compareTo(b.createdAt)
                            : b.createdAt.compareTo(a.createdAt),
                      );
                      break;

                    case SortType.price:
                      products.sort(
                        (a, b) => cheapestFirst.value
                            ? a.price.compareTo(b.price)
                            : b.price.compareTo(a.price),
                      );
                      break;
                    case SortType.none:
                      break;
                  }
                  return BuildCollumnSection(products: products);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
