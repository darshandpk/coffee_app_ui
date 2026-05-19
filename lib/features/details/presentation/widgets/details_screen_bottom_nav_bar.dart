import 'package:coffee_ui/features/home/data/models/coffee_model.dart';
import 'package:coffee_ui/shared/app_widgets/slide_up_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../shared/app_widgets/buttons/app_button.dart';
import '../../../../shared/app_widgets/custom_snack_bar_notification.dart';
import '../../../cart/data/dummy/cart_dummy_data.dart';
import '../../../cart/data/models/cart_item_model.dart';

class DetailsScreenBottomNavBar extends StatelessWidget {
  final CoffeeModel coffeeModel;
  final int quantity;

  const DetailsScreenBottomNavBar({
    super.key,
    required this.coffeeModel,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      decoration: BoxDecoration(
        color: AppColors.kDarkBrown,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          SlideUpAnimation(
            child: Text(
              '\$ ${coffeeModel.price}',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(color: AppColors.kWhite),
            ),
          ),
          SizedBox(width: 30.w),
          Expanded(
            child: AppButton(
              text: 'Add to Cart',
              onTap: () {
                CartDummyData.addToCart(
                  CartItemModel(coffee: coffeeModel, quantity: quantity),
                );
                CustomSnackBarNotification.show(
                  context: context,
                  message: 'Added to cart successfully ☕',
                  backgroundColor: AppColors.kDarkBrown,
                  textColor: AppColors.kCream,
                  icon: Icons.shopping_bag_outlined,
                );
              },
              iconRight: true,
              backgroundColor: AppColors.kCaramel,
            ),
          ),
        ],
      ),
    );
  }
}
