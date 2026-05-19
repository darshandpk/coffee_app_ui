import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:coffee_ui/features/details/presentation/widgets/details_screen_bottom_nav_bar.dart';
import 'package:coffee_ui/features/details/presentation/widgets/details_screen_header_section.dart';
import 'package:coffee_ui/features/home/data/models/coffee_model.dart';
import 'package:coffee_ui/shared/app_widgets/buttons/quantity_selector.dart';
import 'package:coffee_ui/shared/app_widgets/slide_up_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProdDetailsScreen extends StatefulWidget {
  final CoffeeModel coffeeModel;

  const ProdDetailsScreen({super.key, required this.coffeeModel});

  @override
  State<ProdDetailsScreen> createState() => _ProdDetailsScreenState();
}

class _ProdDetailsScreenState extends State<ProdDetailsScreen> {
  String selectedSize = 'Medium';
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DetailsScreenBottomNavBar(
        coffeeModel: widget.coffeeModel,
        quantity:
        quantity,
      ),
      body: Column(
        children: [
          DetailsScreenHeaderSection(coffeeModel: widget.coffeeModel),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SlideUpAnimation(
                      child: Text(
                        widget.coffeeModel.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.kCaramel,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15.sp,
                            color: AppColors.kWhite,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            widget.coffeeModel.rating.toString(),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.kWhite,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                SlideUpAnimation(
                  child: Text(
                    widget.coffeeModel.subtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Coffee Size',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 10.h),
                _sizeButton(),
                SizedBox(height: 20.h),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sizeButton() {
    final sizes = ['Small', 'Medium', 'Large'];

    return SlideUpAnimation(
      child: SizedBox(
        height: 45.h,

        child: ListView.separated(
          scrollDirection: Axis.horizontal,

          physics: const BouncingScrollPhysics(),

          itemCount: sizes.length,

          separatorBuilder: (_, __) => SizedBox(width: 10.w),

          itemBuilder: (context, index) {
            final size = sizes[index];

            final isSelected = selectedSize == size;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSize = size;
                });
              },

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),

                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

                decoration: BoxDecoration(
                  color: isSelected ? AppColors.kCaramel : Colors.transparent,

                  borderRadius: BorderRadius.circular(25.r),

                  border: Border.all(color: AppColors.kCaramel),
                ),

                child: Center(
                  child: Text(
                    size,

                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isSelected ? AppColors.kWhite : AppColors.kDarkBrown,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
