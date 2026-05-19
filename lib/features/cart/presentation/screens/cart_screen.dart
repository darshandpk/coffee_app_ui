import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:coffee_ui/features/cart/data/dummy/cart_dummy_data.dart';
import 'package:coffee_ui/features/cart/presentation/widgets/cart_checkout_section.dart';
import 'package:coffee_ui/features/cart/presentation/widgets/cart_screen_prod_card.dart';
import 'package:coffee_ui/shared/app_widgets/custom_snack_bar_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),

          child: Stack(
            children: [
              /// Main Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 20.h),

                  /// Header
                  Text(
                    'My Cart',

                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// Cart List
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(bottom: 180.h),

                      itemCount: CartDummyData.cartItems.length,

                      separatorBuilder: (_, __) => SizedBox(height: 16.h),

                      itemBuilder: (context, index) {
                        final cartItem = CartDummyData.cartItems[index];

                        return CartScreenProdCard(
                          cartItem: cartItem,

                          onDelete: () {
                            setState(() {
                              CartDummyData.removeFromCart(cartItem.coffee.id);

                              CustomSnackBarNotification.show(
                                context: context,

                                message: 'Removed from cart ☕',

                                backgroundColor: AppColors.kError,

                                textColor: AppColors.kWhite,

                                icon: Icons.delete_outline,
                              );
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              /// Floating Checkout Section
              Positioned(
                left: 0,
                right: 0,
                bottom: 90.h,
                child: CartCheckoutSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
