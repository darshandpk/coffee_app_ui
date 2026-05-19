import 'package:coffee_ui/core/constants/app_assets.dart';

import '../models/coffee_model.dart';

class CoffeeDummyData {
  static List<CoffeeModel> coffees = [
    /// Cappuccino
    CoffeeModel(
      id: 1,
      image: AppAssets.coffee1,
      title: 'Cappuccino',
      subtitle: 'With Chocolate',
      price: 4.20,
      category: 'Cappuccino',
      rating: 4.8,
    ),

    /// Espresso
    CoffeeModel(
      id: 2,
      image: AppAssets.coffee2,
      title: 'Espresso',
      subtitle: 'Strong & Bold',
      price: 3.50,
      category: 'Espresso',
      rating: 4.7,
    ),

    /// Americano
    CoffeeModel(
      id: 3,
      image: AppAssets.coffee3,
      title: 'Americano',
      subtitle: 'Classic Black',
      price: 3.80,
      category: 'Americano',
      rating: 4.6,
    ),

    /// Latte
    CoffeeModel(
      id: 4,
      image: AppAssets.coffee4,
      title: 'Latte',
      subtitle: 'Smooth Milk',
      price: 5.20,
      category: 'Latte',
      rating: 4.9,
    ),

    /// Cold Coffee
    CoffeeModel(
      id: 5,
      image: AppAssets.coffee5,
      title: 'Cold Brew',
      subtitle: 'Iced Fresh',
      price: 5.50,
      category: 'Cold Coffee',
      rating: 4.8,
    ),

    /// Latte
    CoffeeModel(
      id: 6,
      image: AppAssets.coffee6,
      title: 'Iced Latte',
      subtitle: 'Creamy Cold',
      price: 5.10,
      category: 'Latte',
      rating: 4.7,
    ),

    /// Mocha
    CoffeeModel(
      id: 7,
      image: AppAssets.coffee7,
      title: 'Mocha Frappe',
      subtitle: 'Chocolate Blend',
      price: 6.20,
      category: 'Mocha',
      rating: 4.9,
    ),

    /// Frappé
    CoffeeModel(
      id: 8,
      image: AppAssets.coffee8,
      title: 'Vanilla Cold Coffee',
      subtitle: 'Sweet & Cool',
      price: 5.90,
      category: 'Frappé',
      rating: 4.5,
    ),

    /// Jacobs Coffee
    CoffeeModel(
      id: 9,
      image: AppAssets.coffee9,
      title: 'Jacobs Latte',
      subtitle: 'Premium Roast',
      price: 6.80,
      category: 'Jacobs Coffee',
      rating: 4.9,
    ),

    /// Espresso
    CoffeeModel(
      id: 10,
      image: AppAssets.coffee10,
      title: 'Jacobs Espresso',
      subtitle: 'Strong Taste',
      price: 6.50,
      category: 'Espresso',
      rating: 4.8,
    ),

    /// Premium Blend
    CoffeeModel(
      id: 11,
      image: AppAssets.coffee11,
      title: 'Caramel Jacobs',
      subtitle: 'Sweet Premium',
      price: 7.20,
      category: 'Premium Blend',
      rating: 4.9,
    ),

    /// Macchiato
    CoffeeModel(
      id: 12,
      image: AppAssets.coffee12,
      title: 'Hazelnut Jacobs',
      subtitle: 'Nutty Aroma',
      price: 7.50,
      category: 'Macchiato',
      rating: 4.8,
    ),
  ];
}
