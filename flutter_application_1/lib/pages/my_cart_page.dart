import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/cart.dart';
import 'package:flutter_application_1/models/creator.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/pages/widget/appbar.dart';
import 'package:flutter_application_1/pages/widget/build_section.dart';
import 'package:flutter_application_1/pages/widget/one_row_product_card.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = getCurrentUserCart();

    return Scaffold(
      appBar: Appbar1(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Colors.blue[800],
                alignment: Alignment.center,
                child: Text(
                  'Shopping cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 10),
              BuildMyCart(cart: cart, onChanged: () => setState(() {})),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text('Total: ${cart.totalItems} item(s)'),
                      Text('\$ ${cart.totalPrice.toStringAsFixed(2)}'),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                      ),
                      onPressed: () {},
                      child: Text(
                        'CheckOut',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
