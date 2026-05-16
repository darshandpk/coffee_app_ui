import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:coffee_ui/core/config/theme/app_typography.dart';
import 'package:coffee_ui/features/onboarding/data/models/onboarding_model.dart';
import 'package:coffee_ui/shared/app_widgets/slide_up_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewWidget extends StatelessWidget {
  final OnboardingModel product;

  const PageViewWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80),
      child: Column(
        children: [
          SlideUpAnimation(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Image.asset(product.image),
            ),
          ),
          SizedBox(height: 40.h),
          SlideUpAnimation(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Text(
                product.title,
                style: AppTypography.splashTitle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Text(
              product.subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.kCream),
            ),
          ),
        ],
      ),
    );
  }
}
