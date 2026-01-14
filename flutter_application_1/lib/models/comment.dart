import 'package:flutter_application_1/models/product.dart';

class Comment {
  final String id;
  final String userName;
  final String text;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.userName,
    required this.text,
    required this.createdAt,
  });
}

void addComment(Product product, Comment newComment) {
  product.comments.add(newComment);
}
