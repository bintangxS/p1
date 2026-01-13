import 'package:flutter/material.dart';
//import 'package:flutter_application_1/data/dummy_data.dart';
import 'package:flutter_application_1/data/product/all_product.dart';
import 'package:flutter_application_1/models/creator.dart';
import 'package:flutter_application_1/models/product.dart';

class CreatorRowSection extends StatelessWidget {
  const CreatorRowSection({super.key, required this.seller});
  final User seller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 170,
        margin: EdgeInsets.only(right: 12),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
        ),
      ),
    );
  }
}
