import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/dummy_data.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/data/category.dart';
import 'package:flutter_application_1/pages/product_search_page.dart';

class NextPrevPageWidget extends StatelessWidget {
  final int page;
  final int totalPages;
  final Function(int) onPage;
  const NextPrevPageWidget({
    super.key,
    required this.totalPages,
    required this.page,
    required this.onPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 1; i <= totalPages; i++)
          TextButton(
            onPressed: () => (() => onPage(i)),
            child: Text(
              i.toString(),
              style: TextStyle(
                fontWeight: page == i ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
      ],
    );
  }
}
