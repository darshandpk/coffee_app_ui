import 'package:coffee_ui/app.dart';
import 'package:coffee_ui/core/di/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Mock SharedPreferences
    SharedPreferences.setMockInitialValues({});

    final prefs = await SharedPreferences.getInstance();

    final showOnboarding =
    !(prefs.getBool('onboarding_complete') ?? false);

    // Initialize dependency injection
    await configureDependencies(
      prefs: prefs,
      showOnboarding: showOnboarding,
    );

    // Pump app
    await tester.pumpWidget(
      MyApp(
        router: sl<GoRouter>(),
      ),
    );

    // Verify app loaded
    expect(find.byType(MyApp), findsOneWidget);
  });
}