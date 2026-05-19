import '../../../home/data/models/coffee_model.dart';

class CartItemModel {
  final CoffeeModel coffee;
  int quantity;

  CartItemModel({
    required this.coffee,
    this.quantity = 1,
  });
}