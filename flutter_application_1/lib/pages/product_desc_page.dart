import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/cart.dart';
import 'package:flutter_application_1/data/category.dart';
import 'package:flutter_application_1/data/dummy_data.dart';
import 'package:flutter_application_1/data/product/all_product.dart';
import 'package:flutter_application_1/data/user.dart';
import 'package:flutter_application_1/models/creator.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/models/store.dart';
import 'package:flutter_application_1/pages/product_search_page.dart';
import 'package:flutter_application_1/pages/store_page.dart';
import 'package:flutter_application_1/pages/widget/appbar.dart';
import 'package:flutter_application_1/pages/widget/build_collumn_section.dart';
import 'package:flutter_application_1/pages/widget/build_section.dart';
import 'package:flutter_application_1/pages/widget/shortcut.dart';
import 'package:flutter_application_1/pages/widget/show_comment.dart';

class ProductDescPage extends StatefulWidget {
  final Product product;
  const ProductDescPage({
    super.key,
    required this.product,
    //this.isFavorite
  });

  @override
  State<ProductDescPage> createState() => _ProductDescPageState();
}

class _ProductDescPageState extends State<ProductDescPage> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final store = getStoreById(product.storeId); // ✅ ADD THIS
    final creatorProducts = ProductRepository.all()
        .where(
          (p) => p.storeId == product.storeId,
        ) // optional: exclude current product
        .toList();

    return Scaffold(
      appBar: Appbar1(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CarouselSlider.builder(
                  itemCount: product.imagesUrl.length,
                  itemBuilder: (context, index, _) {
                    return SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        product.galleryImages[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                  ),
                ),
                //Image.asset(product.imageUrl),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => pushNav(
                      context,
                      ProductSearchPage(productCategory: product.category),
                    ),
                    child: Text(
                      product.category.label,
                      style: TextStyle(
                        color: Colors.green[900],
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pushNav(context, StorePage(storeId: product.storeId));
                        },
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: store.storeImage == null
                              ? Colors.grey.shade400
                              : null,
                          backgroundImage: store.storeImage != null
                              ? AssetImage(store.storeImage!)
                              : null,
                          child: store.storeImage == null
                              ? Icon(
                                  Icons.person,
                                  size: 14,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),

                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          pushNav(context, StorePage(storeId: product.storeId));
                        },
                        child: Text(
                          store.storeName,
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(product.title, style: TextStyle(fontSize: 34)),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Price: ', style: TextStyle(fontSize: 24)),
                            Text(
                              '\$ ${product.price.toString()}',
                              style: TextStyle(fontSize: 24, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(width: 1, height: 50, color: Colors.amber),
                      SizedBox(width: 20),
                      Text(
                        'stock: ${product.stock}',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      //minimumSize: const Size.fromHeight(48),
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 25,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        getCurrentUserCart().addProduct(product);
                      });
                    },
                    child: Stack(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Icon(Icons.shopping_cart, size: 25),
                        ),
                        Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: FilledButton(
                      onPressed: () {},
                      child: Text('Buy Now', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      /// SHARE — takes remaining space
                      Expanded(
                        child: FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            minimumSize: const Size.fromHeight(44),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.share_outlined),
                              SizedBox(width: 6),
                              Text('Share'),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Material(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                            width: 70,
                            height: 44,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite,

                                  color: Colors.red,
                                  size: 20,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  product.favoriteCount.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 50),
                  Divider(),
                  Text(
                    'Product Summary',
                    style: TextStyle(
                      color: Colors.lightBlue[900],
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                    product.productDesc,
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  ShowComment(product: product),
                  SizedBox(height: 30),
                  Divider(),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pushNav(context, StorePage(storeId: product.storeId));
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: store.storeImage == null
                              ? Colors.grey.shade400
                              : null,
                          backgroundImage: store.storeImage != null
                              ? AssetImage(store.storeImage!)
                              : null,
                          child: store.storeImage == null
                              ? Icon(
                                  Icons.person,
                                  size: 14,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),

                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          pushNav(context, StorePage(storeId: product.storeId));
                        },
                        child: Text(store.storeName),
                      ),
                      Spacer(),
                      FilledButton(onPressed: () {}, child: Text('Follow')),
                    ],
                  ),
                  SizedBox(height: 10),
                  BuildRowSection(products: creatorProducts, showMore: false),
                  SizedBox(height: 50),
                  Divider(),
                  SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        Text('Related Items'),
                        SizedBox(height: 10),
                        BuildCollumnSection(
                          products: ProductRepository.byCategory(
                            product.category,
                          ).where((p) => p.id != product.id).take(6).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
