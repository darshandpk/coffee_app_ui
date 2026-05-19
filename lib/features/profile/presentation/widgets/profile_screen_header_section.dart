import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';

class ProfileScreenHeaderSection extends StatelessWidget {
  const ProfileScreenHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.only(top: 50.h, bottom: 35.h),

      decoration: BoxDecoration(
        color: AppColors.kDarkBrown,

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),

      child: Column(
        children: [
          Text(
            'My Profile',

            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.kWhite,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 24.h),

          /// Avatar
          CircleAvatar(
            radius: 50.r,
            backgroundColor: AppColors.kCaramel,

            child: Icon(Icons.person, size: 55.sp, color: AppColors.kWhite),
          ),

          SizedBox(height: 14.h),

          Text(
            'Darshan',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: AppColors.kWhite),
          ),

          SizedBox(height: 6.h),

          Text(
            'Coffee Lover ☕',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.kCream),
          ),
        ],
      ),
    );
  }
}
