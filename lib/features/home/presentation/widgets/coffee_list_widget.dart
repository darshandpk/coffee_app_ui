import 'package:coffee_ui/features/home/data/models/coffee_model.dart';
import 'package:coffee_ui/shared/app_widgets/coffee_simple_card.dart';
import 'package:flutter/material.dart';

class CoffeeListWidget extends StatelessWidget {
  final List<CoffeeModel> coffeeModel;

  const CoffeeListWidget({super.key, required this.coffeeModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(coffeeModel.length, (index) {
          return CoffeeSimpleCard(coffeeModel: coffeeModel[index]);
        }),
      ),
    );
  }
}
