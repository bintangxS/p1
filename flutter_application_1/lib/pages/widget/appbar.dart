import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/user.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/my_cart_page.dart';
import 'package:flutter_application_1/pages/widget/shortcut.dart';

class Appbar1 extends StatelessWidget implements PreferredSizeWidget {
  const Appbar1({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Fan works'),
      backgroundColor: Colors.blue[600],
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, size: 30, fontWeight: FontWeight.w700),
        ),
        IconButton(
          onPressed: () {
            if (currentUser == null) {
              // show login dialog / redirect
              return pushNav(context, LoginPage());
            }
            pushNav(context, const MyCartPage());
          },
          icon: Icon(Icons.shopping_cart),
        ),
        VerticalDivider(color: Colors.grey),
        IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
