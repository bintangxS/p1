import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/pages/product_search_page.dart';
import 'package:flutter_application_1/pages/widget/shortcut.dart';

/*class Category {
  final String title;
  final Icon icon;

  Category({required this.title, required this.icon});
}

final Category comics = Category(title: 'Comics', icon: Icon(Icons.abc));

final Category ilustration = Category(
  title: 'Ilustration',
  icon: Icon(Icons.draw),
);

final Category novel = Category(title: 'Novel', icon: Icon(Icons.book));*/

class CategoryCard extends StatelessWidget {
  final String title;
  final Icon icon;
  final Color bg;
  final ProductCategory category;
  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.bg,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushNav(context, ProductSearchPage(productCategory: category));
      },
      child: Card(
        color: bg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        margin: const EdgeInsets.only(bottom: 12.0),
        child: InkWell(
          onTap: () {
            pushNav(context, ProductSearchPage(productCategory: category));
          },
          child: SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  icon,
                  SizedBox(width: 10),
                  Text(
                    category.label,
                    style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'title': 'Manga',
        'Icon': Icons.menu_book,
        'bg': Colors.blue,
        Category: ProductCategory.manga,
      },
      {
        'title': 'Ilustration',
        'Icon': Icons.brush,
        'bg': Colors.blue,
        Category: ProductCategory.illustration,
      },
      {
        'title': 'Novel',
        'Icon': Icons.book,
        'bg': Colors.blue,
        Category: ProductCategory.novel,
      },
      {
        'title': 'Goods',
        'Icon': Icons.shopping_bag,
        'bg': Colors.blue,
        Category: ProductCategory.goods,
      },
      {
        'title': '3D Models',
        'Icon': Icons.view_in_ar,
        'bg': Colors.blue,
        Category: ProductCategory.asset3DModels,
      },
      {
        'title': 'Music',
        'Icon': Icons.music_note,
        'bg': Colors.blue,
        Category: ProductCategory.music,
      },
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 0,
        childAspectRatio: 3.5,
      ),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryCard(
          title: categories[index]['title'] as String,
          icon: Icon(categories[index]['Icon'] as IconData),
          bg: categories[index]['bg'] as Color,
          category: categories[index][Category] as ProductCategory,
        );
      },
    );
  }
}
