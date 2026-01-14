import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/category.dart';
import 'package:flutter_application_1/data/product/all_product.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/pages/widget/event.dart';
import 'widget/build_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      //padding: EdgeInsets.all(12),
      children: [
        //BannerCarousel(),
        EventBanner(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 12),
              Category(),
            ],
          ),
        ),
        Divider(),

        BuildRowSection(
          title: 'Comics',
          products: ProductRepository.byCategory(
            ProductCategory.manga,
            limit: 7,
          ),
          showMore: true,
        ),
        SizedBox(height: 24),
        Divider(),

        BuildRowSection(
          title: 'Novel',
          products: ProductRepository.byCategory(
            ProductCategory.novel,
            limit: 7,
          ),
          showMore: true,
        ),
        SizedBox(height: 24),
        Divider(),

        BuildRowSection(
          title: 'Illustration',
          products: ProductRepository.byCategory(
            ProductCategory.illustration,
            limit: 7,
          ),
          showMore: true,
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
