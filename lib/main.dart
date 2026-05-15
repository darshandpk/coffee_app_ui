import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showOnboarding = !(prefs.getBool('onboarding_complete') ?? false);
  await configureDependencies(prefs: prefs, showOnboarding: showOnboarding);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp(router: sl<GoRouter>()));
}
