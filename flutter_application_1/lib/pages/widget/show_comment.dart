import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/dummy_data.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:intl/intl.dart';
import '../../models/comment.dart';

class ShowComment extends StatefulWidget {
  const ShowComment({super.key, required this.product});
  final Product product;

  @override
  State<ShowComment> createState() => _ShowCommentState();
}

class _ShowCommentState extends State<ShowComment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text('User Reviews:', style: TextStyle(fontSize: 18)),
        SizedBox(height: 15),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(radius: 25, backgroundColor: Colors.amberAccent),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hint: Text('Leave Review'),
                      isDense: true,
                      contentPadding: EdgeInsets.only(bottom: 6),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            if (widget.product.comments.isEmpty) Text('There\'s no Review yet'),
            ListView.builder(
              itemCount: widget.product.comments.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final comment = widget.product.comments[index];
                return Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.amberAccent,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  comment.userName,
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  DateFormat(
                                    'yyyy-MM-dd',
                                  ).format(comment.createdAt),
                                ),
                              ],
                            ),
                            Text(
                              comment.text,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
