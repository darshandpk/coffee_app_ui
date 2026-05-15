import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/router.dart';

final sl = GetIt.instance;

Future<void> configureDependencies({
  required SharedPreferences prefs,
  required bool showOnboarding,
}) async {
  // External
  sl.registerLazySingleton<SharedPreferences>(() => prefs);
  sl.registerLazySingleton<http.Client>(() => http.Client());

  // Core
  sl.registerLazySingleton<AppRouter>(
    () => AppRouter(showOnboarding: showOnboarding, prefs: sl()),
  );
  sl.registerLazySingleton<GoRouter>(() => sl<AppRouter>().router);
}
