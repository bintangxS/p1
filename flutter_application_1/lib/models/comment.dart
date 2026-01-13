import 'package:flutter_application_1/data/dummy_data.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/dummy_data.dart';
import 'package:flutter_application_1/models/creator.dart';
import 'package:flutter_application_1/pages/product_desc_page.dart';
import '../../models/product.dart';

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
