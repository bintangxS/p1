import 'package:flutter/material.dart';
//import 'package:flutter_application_1/data/dummy_data.dart';
//import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/my_page.dart';
//import 'package:flutter_application_1/pages/product_search_page.dart';
import 'package:flutter_application_1/pages/widget/appbar.dart';
import 'package:flutter_application_1/pages/widget/navbar_widget.dart';
import 'package:flutter_application_1/pages/widget/notifier.dart';

List<Widget> pages = [HomePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar1(),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
    );
  }
}
