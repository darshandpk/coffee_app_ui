import 'package:coffee_ui/shared/app_widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../data/dummy/cart_dummy_data.dart';

class CartCheckoutSection extends StatefulWidget {
  const CartCheckoutSection({super.key});

  @override
  State<CartCheckoutSection> createState() => _CartCheckoutSectionState();
}

class _CartCheckoutSectionState extends State<CartCheckoutSection> {
  double get totalPrice {
    return CartDummyData.cartItems.fold(
      0,
      (sum, item) => sum + (item.coffee.price * item.quantity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),

      decoration: BoxDecoration(
        color: AppColors.kDarkBrown,

        borderRadius: BorderRadius.circular(25),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          /// Total Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                'Total Price',

                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.kCream),
              ),

              Text(
                '\$${totalPrice.toStringAsFixed(2)}',

                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.kWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          SizedBox(height: 18.h),

          /// Checkout Button
          AppButton(
            text: 'Proceed To Checkout',
            onTap: () {},
            iconRight: false,
            backgroundColor: AppColors.kCaramel,
          ),
        ],
      ),
    );
  }
}
