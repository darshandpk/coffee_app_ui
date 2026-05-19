import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSnackBarNotification {
  CustomSnackBarNotification._();

  static void show({
    required BuildContext context,
    required String message,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    IconData? icon,
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),

        content: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 350),
          tween: Tween<double>(begin: 0.85, end: 1),

          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Opacity(opacity: value, child: child),
            );
          },

          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),

            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(18.r),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),

            child: Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: textColor, size: 22.sp),
                  SizedBox(width: 12.w),
                ],

                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
