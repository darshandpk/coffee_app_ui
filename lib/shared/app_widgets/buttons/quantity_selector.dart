import 'package:coffee_ui/shared/app_widgets/slide_up_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/theme/app_colors.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;

  final VoidCallback onIncrement;

  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return SlideUpAnimation(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      
        decoration: BoxDecoration(
          color: AppColors.kDarkBrown,
      
          borderRadius: BorderRadius.circular(30.r),
        ),
      
        child: Row(
          mainAxisSize: MainAxisSize.min,
      
          children: [
            GestureDetector(
              onTap: onDecrement,
      
              child: Container(
                height: 28.h,
                width: 28.w,
      
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
      
                  color: AppColors.kCaramel.withOpacity(0.18),
                ),
      
                child: Icon(Icons.remove, size: 16.sp, color: AppColors.kCream),
              ),
            ),
      
            SizedBox(width: 14.w),
      
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
      
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.4),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: Text(
                '$quantity',
                key: ValueKey(quantity),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.kWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
      
            SizedBox(width: 14.w),
      
            GestureDetector(
              onTap: onIncrement,
              child: Container(
                height: 28.h,
                width: 28.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kCaramel,
                ),
                child: Icon(Icons.add, size: 16.sp, color: AppColors.kWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
