import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:coffee_ui/features/home/data/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeSimpleCard extends StatelessWidget {
  final CoffeeModel coffeeModel;

  const CoffeeSimpleCard({super.key, required this.coffeeModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      decoration: BoxDecoration(
        color: AppColors.kDarkBrown,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.kShadow,
            offset: Offset(0, 8),
            blurRadius: 18,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: SizedBox(
                height: 150.h,
                width: double.infinity,
                child: Image.asset(coffeeModel.image, fit: BoxFit.contain),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    coffeeModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: AppColors.kCaramel),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.star, color: AppColors.kCaramel, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(
                      coffeeModel.rating.toString(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.kCaramel,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              coffeeModel.subtitle,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.kCaramel),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${coffeeModel.price.toString()}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: AppColors.kCaramel),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.kCaramel.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(child: Icon(Icons.add, color: AppColors.kCaramel,),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
