import 'package:flutter_application_1/models/comment.dart';

enum ProductCategory {
  illustration,
  manga,
  novel,
  music,
  goods,
  asset3DModels,
  audiogoods,
}

extension ProductCategoryExt on ProductCategory {
  String get label {
    switch (this) {
      case ProductCategory.illustration:
        return 'illustration';
      case ProductCategory.manga:
        return 'Manga';
      case ProductCategory.novel:
        return 'Novel';
      case ProductCategory.music:
        return 'Music';
      case ProductCategory.goods:
        return 'Goods';
      case ProductCategory.asset3DModels:
        return 'Asset 3D Models';
      case ProductCategory.audiogoods:
        return 'Audio Goods';
    }
  }
}

class Product {
  final String id;
  final String title;
  final DateTime createdAt;
  final String description;
  final double price;
  //final String imageUrl;
  final List<String> imagesUrl;
  final ProductCategory category;
  final String storeId;
  final String productDesc;
  final int stock;
  //bool isFavorite;
  //bool isOnCart;
  int favoriteCount;
  final List<Comment> comments;

  Product({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.description,
    required this.stock,
    required this.price,
    required this.imagesUrl,
    required this.category,
    required this.storeId,
    required this.productDesc,
    //this.isFavorite = false,
    //this.isOnCart = false,
    this.favoriteCount = 0,
    List<Comment>? comments,
  }) : comments = comments ?? [],
       assert(imagesUrl.isNotEmpty);

  String get coverImage => imagesUrl.first;
  List<String> get galleryImages => imagesUrl;
}
