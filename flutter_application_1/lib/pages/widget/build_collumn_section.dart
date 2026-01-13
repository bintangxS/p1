import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/pages/widget/build_section.dart';

class BuildCollumnSection extends StatelessWidget {
  const BuildCollumnSection({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //padding: EdgeInsets.all(8),
      width: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.79,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return buildProductCard(product, context);
        },
      ),
    );
  }
}
