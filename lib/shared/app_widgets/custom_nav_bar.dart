import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:coffee_ui/core/config/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.shopping_cart_outlined,
    Icons.person_outlined,
  ];

  List<IconData> activeIcons = [Icons.home, Icons.shopping_cart, Icons.person];
  final List<String> labels = ['Home', 'Cart', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.kDarkBrown,
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.kShadow,
            offset: Offset(0, 10),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (index) {
          final isSelected = widget.currentIndex == index;
          return GestureDetector(
            onTap: () => widget.onTap(index),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(
                horizontal: isSelected ? 18.w : 14.w,
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.kCaramel.withOpacity(0.18)
                    : AppColors.kTransparent,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                children: [
                  /// Icon
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      isSelected ? activeIcons[index] : icons[index],
                      key: ValueKey(isSelected),
                      color: isSelected ? AppColors.kCaramel : AppColors.kCream,
                      size: 24.sp,
                    ),
                  ),

                  /// Label
                  AnimatedSize(
                    duration: Duration(milliseconds: 250),
                    child: isSelected
                        ? Row(
                            children: [
                              SizedBox(width: 8.w),
                              Text(
                                labels[index],
                                style: AppTypography.bodyMedium.copyWith(
                                  color: AppColors.kCaramel,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
