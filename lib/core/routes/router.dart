import 'package:coffee_ui/core/routes/app_routes.dart';
import 'package:coffee_ui/features/cart/presentation/screens/cart_screen.dart';
import 'package:coffee_ui/features/details/presentation/screens/prod_details_screen.dart';
import 'package:coffee_ui/features/home/data/models/coffee_model.dart';
import 'package:coffee_ui/features/home/presentation/screens/home_screen.dart';
import 'package:coffee_ui/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:coffee_ui/features/profile/presentation/screens/profile_screen.dart';
import 'package:coffee_ui/features/splash/presentation/screens/splash_screen.dart';
import 'package:coffee_ui/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRouter {
  final bool showOnboarding;
  final SharedPreferences prefs;

  AppRouter({required this.showOnboarding, required this.prefs});

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.cart,
        name: AppRoutes.cart,
        builder: (context, state) => CartScreen(),
      ),
      GoRoute(
        path: AppRoutes.prodDetails,
        pageBuilder: (context, state) {
          final coffee = state.extra as CoffeeModel;

          return CustomTransitionPage(
            key: state.pageKey,

            child: ProdDetailsScreen(coffeeModel: coffee),

            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
      GoRoute(
        path: AppRoutes.profile,
        name: AppRoutes.profile,
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.main,
        name: AppRoutes.main,
        builder: (context, state) => MainScreen(),
      ),
    ],
    redirect: (context, state) {
      final onboardingDone = prefs.getBool('onboarding_complete') ?? false;
      final location = state.matchedLocation;
      final isSplash = location == AppRoutes.splash;
      if (isSplash) return null;
      if (!onboardingDone) return AppRoutes.onboarding;
      return null;
    },
  );
}
