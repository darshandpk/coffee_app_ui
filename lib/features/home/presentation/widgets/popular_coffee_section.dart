import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:coffee_ui/features/home/presentation/widgets/popular_coffee_carousel.dart';
import 'package:coffee_ui/shared/app_widgets/buttons/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/dummy/coffee_dummy_data.dart';

class PopularCoffeeSection extends StatefulWidget {
  const PopularCoffeeSection({super.key});

  @override
  State<PopularCoffeeSection> createState() => _PopularCoffeeSectionState();
}

class _PopularCoffeeSectionState extends State<PopularCoffeeSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Most Loved Coffees',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.kDarkBrown,
                ),
              ),
              CustomTextButton(
                icon: Icons.arrow_forward_ios,
                text: 'view all',
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        PopularCoffeeCarousel(coffees: CoffeeDummyData.coffees),
      ],
    );
  }
}
