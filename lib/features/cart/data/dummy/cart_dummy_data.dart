import '../models/cart_item_model.dart';

class CartDummyData {

  static List<CartItemModel>
  cartItems = [];

  static void addToCart(
      CartItemModel item) {

    final existingIndex =
    cartItems.indexWhere(
          (cartItem) =>
      cartItem.coffee.id ==
          item.coffee.id,
    );

    /// Already exists
    if (existingIndex != -1) {

      cartItems[existingIndex]
          .quantity++;

    } else {

      cartItems.add(item);
    }
  }

  static void removeFromCart(
      int coffeeId) {

    cartItems.removeWhere(
          (item) =>
      item.coffee.id ==
          coffeeId,
    );
  }
}