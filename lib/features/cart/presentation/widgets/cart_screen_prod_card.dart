import 'package:coffee_ui/features/cart/data/dummy/cart_dummy_data.dart';
import 'package:coffee_ui/shared/app_widgets/buttons/custom_icon_button.dart';
import 'package:coffee_ui/shared/app_widgets/buttons/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../data/models/cart_item_model.dart';

class CartScreenProdCard extends StatefulWidget {
  final CartItemModel cartItem;
  final VoidCallback
  onDelete;

  const CartScreenProdCard({super.key, required this.cartItem, required this.onDelete});

  @override
  State<CartScreenProdCard> createState() => _CartScreenProdCardState();
}

class _CartScreenProdCardState extends State<CartScreenProdCard> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),

      decoration: BoxDecoration(
        color: AppColors.kDarkBrown,

        borderRadius: BorderRadius.circular(24.r),
      ),

      child: Row(
        children: [
          /// Image
          Container(
            height: 90.h,

            width: 90.w,

            decoration: BoxDecoration(
              color: AppColors.kCaramel.withOpacity(0.12),

              borderRadius: BorderRadius.circular(18.r),
            ),

            child: Padding(
              padding: EdgeInsets.all(12.w),

              child: Image.asset(widget.cartItem.coffee.image),
            ),
          ),

          SizedBox(width: 14.w),

          /// Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.cartItem.coffee.title,

                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(color: AppColors.kWhite),
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          widget.cartItem.coffee.subtitle,

                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.kCream),
                        ),
                      ],
                    ),
                    CustomIconButton(
                      icon: Icons.delete,
                      onTap: widget.onDelete,
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      '\$${widget.cartItem.coffee.price}',

                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(color: AppColors.kCaramel),
                    ),

                    QuantitySelector(
                      quantity: quantity,

                      onIncrement: () {
                        setState(() {
                          quantity++;
                        });
                      },

                      onDecrement: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
