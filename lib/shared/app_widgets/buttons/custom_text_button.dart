import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? textColor;
  final VoidCallback onTap;

  const CustomTextButton({
    super.key,
    required this.text,
    this.icon,
    this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: textColor ?? AppColors.kCaramel,
            ),
          ),
          SizedBox(width: 8.w),
          Icon(icon, color: textColor ?? AppColors.kCaramel, size: 13.sp),
        ],
      ),
    );
  }
}
