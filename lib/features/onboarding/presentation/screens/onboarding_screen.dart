import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:coffee_ui/core/constants/app_assets.dart';
import 'package:coffee_ui/core/routes/app_routes.dart';
import 'package:coffee_ui/features/onboarding/data/models/onboarding_model.dart';
import 'package:coffee_ui/features/onboarding/presentation/widgets/page_view_widget.dart';
import 'package:coffee_ui/shared/app_widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> onboardingData = [
    OnboardingModel(
      image: AppAssets.onboarding1,
      title: 'Fall in Love\nwith Coffee in\nBlissful Delight!',
      subtitle: 'Experience handcrafted coffee\nmade with passion and warmth.',
    ),
    OnboardingModel(
      image: AppAssets.onboarding2,
      title: 'Choose Your\nFavourite Coffee',
      subtitle: 'From cappuccino to espresso,\ncrafted exactly to your taste.',
    ),
    OnboardingModel(
      image: AppAssets.onboarding3,
      title: 'Delivered\nFresh To You',
      subtitle: 'Freshly brewed happiness\ndelivered right to your doorstep.',
    ),
  ];

  bool get isLastPage => _currentPage == onboardingData.length - 1;

  Future<void> _nextPage() async {
    if (isLastPage) {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setBool('onboarding_complete', true);

      if (mounted) {
        context.go(AppRoutes.main);
      }
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kCoffeeBrown,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (_, index) {
                final item = onboardingData[index];
                return PageViewWidget(product: item);
              },
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: onboardingData.length,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              spacing: 8,
              activeDotColor: AppColors.kCaramel,
              dotColor: AppColors.kCream.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: 'Previous',
                    onTap: _previousPage,
                    iconRight: false,
                    backgroundColor: AppColors.kCaramel,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: AppButton(
                    text: isLastPage ? 'Get Started' : 'Next',
                    onTap: _nextPage,
                    iconRight: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
