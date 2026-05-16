import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:coffee_ui/core/config/theme/app_typography.dart';
import 'package:coffee_ui/core/constants/app_assets.dart';
import 'package:coffee_ui/core/routes/app_routes.dart';
import 'package:coffee_ui/shared/app_widgets/slide_up_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(Duration(seconds: 2));

    if (!mounted) return;
    final prefs = await SharedPreferences.getInstance();
    final onboardingDone = prefs.getBool('onboarding_complete') ?? false;
    if (!mounted) return;
    context.go(onboardingDone ? AppRoutes.main : AppRoutes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kDarkBrown,

      body: SafeArea(
        child: Column(
          children: [
            /// Top Image
            Expanded(
              flex: 6,
              child: SizedBox(
                width: double.infinity,

                child: SlideUpAnimation(
                  child: Image.asset(AppAssets.splashBg2, fit: BoxFit.cover),
                ),
              ),
            ),

            /// Bottom Content
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    /// Title
                    SlideUpAnimation(
                      child: Text(
                        'Fall in Love\nwith Coffee in\nBlissful Delight!',
                        textAlign: TextAlign.center,

                        style: AppTypography.splashTitle,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    /// Subtitle
                    SlideUpAnimation(
                      child: Text(
                        'Welcome to our cozy coffee corner,\nwhere every cup is a delightful experience.',
                        textAlign: TextAlign.center,

                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.kCream,
                        ),
                      ),
                    ),

                    SizedBox(height: 36.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
