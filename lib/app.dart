import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'core/config/theme/app_theme.dart';
import 'core/config/theme/app_typography.dart';

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({
    super.key,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        390,
        844,
      ),

      minTextAdapt: true,
      splitScreenMode: true,

      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner:
          false,

          title: 'Coffee App',

          routerConfig: router,

          theme:
          AppTheme.lightTheme
              .copyWith(
            textTheme:
            AppTypography
                .textTheme,
          ),
        );
      },
    );
  }
}