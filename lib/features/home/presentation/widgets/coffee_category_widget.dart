import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeCategoryWidget extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CoffeeCategoryWidget({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final coffeeCategories = [
      'All Coffee',
      'Hot Coffee',
      'Cold Coffee',
      'Espresso',
      'Cappuccino',
      'Latte',
      'Americano',
      'Mocha',
      'Macchiato',
      'Frappé',
      'Premium Blend',
      'Jacobs Coffee',
    ];

    return SizedBox(
      height: 30.h,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,

        itemCount: coffeeCategories.length,

        separatorBuilder: (_, __) => SizedBox(width: 10.w),

        itemBuilder: (context, index) {
          final category = coffeeCategories[index];

          final isSelected = selectedCategory == category;

          return GestureDetector(
            onTap: () {
              onCategorySelected(category);
            },

            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.kCaramel : AppColors.kTransparent,
                borderRadius: BorderRadius.circular(25.r),
                border: Border.all(color: AppColors.kCaramel)
              ),
              child: Text(
                category,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isSelected ? AppColors.kWhite : AppColors.kDarkBrown,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
