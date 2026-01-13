import 'package:flutter_application_1/data/user.dart';
import 'package:flutter_application_1/models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class Cart {
  final String userId;
  final List<CartItem> items;

  Cart({required this.userId, List<CartItem>? items}) : items = items ?? [];

  void addProduct(Product product) {
    final index = items.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      items[index].quantity++;
    } else {
      items.add(CartItem(product: product));
    }
  }

  void removeProduct(String productId) {
    items.removeWhere((item) => item.product.id == productId);
  }

  void decreaseQuantity(String productId) {
    final index = items.indexWhere((item) => item.product.id == productId);

    if (index >= 0) {
      if (items[index].quantity > 1) {
        items[index].quantity--;
      } else {
        items.removeAt(index);
      }
    }
  }

  int get totalItems {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalPrice {
    return items.fold(
      00,
      (sum, item) => sum + item.product.price * item.quantity,
    );
  }

  void clear() {
    items.clear();
  }
}

final Map<String, Cart> carts = {};

Cart getCurrentUserCart() {
  if (currentUser == null) {
    throw Exception('User not logged in');
  }

  return carts.putIfAbsent(
    currentUser!.userid,
    () => Cart(userId: currentUser!.userid),
  );
}
