import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/cart.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/models/store.dart';
import 'package:flutter_application_1/pages/product_desc_page.dart';
import 'package:flutter_application_1/pages/widget/shortcut.dart';

class OneRowProductCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDelete;
  const OneRowProductCard({
    super.key,
    required this.item,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  });
  @override
  Widget build(BuildContext context) {
    final product = item.product;
    final store = getStoreById(product.storeId);
    return GestureDetector(
      onTap: () {
        pushNav(context, ProductDescPage(product: product));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    product.coverImage,
                    width: 80,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          store.storeName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          '\$ ${product.price.toString()}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(product.category.label), Spacer(),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: onRemove,
                  ),
                  IconButton(icon: const Icon(Icons.add), onPressed: onAdd),
                  //const Spacer(),
                  Text('Buy Later'),
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: onDelete,
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

class BuildMyCart extends StatelessWidget {
  final Cart cart;
  final void Function() onChanged;
  const BuildMyCart({super.key, required this.cart, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final cart = getCurrentUserCart();
    if (cart.items.isEmpty) {
      return const Center(child: Text('Cart is empty'));
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cart.items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = cart.items[index];
        return OneRowProductCard(
          item: item,
          onAdd: () {
            cart.addProduct(item.product);
            onChanged();
          },
          onRemove: () {
            cart.decreaseQuantity(item.product.id);
            onChanged();
          },
          onDelete: () {
            cart.removeProduct(item.product.id);
            onChanged();
          },
        );
      },
    );
  }
}
/*!11111111
Widget buildOneRowProductCard(Product product, BuildContext context) {
  final Cart = getCurrentUserCart();
  final store = getStoreById(product.storeId);
  return SizedBox(
    width: double.infinity,
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      itemCount: Cart.items.length,
      itemBuilder: (BuildContext context, int index) {
        return 
      },
    ),
  );
}
*/