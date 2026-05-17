import 'package:coffee_ui/features/cart/presentation/screens/cart_screen.dart';
import 'package:coffee_ui/features/home/presentation/screens/home_screen.dart';
import 'package:coffee_ui/features/profile/presentation/screens/profile_screen.dart';
import 'package:coffee_ui/shared/app_widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> screens = [HomeScreen(), CartScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: Container(
              key: ValueKey(currentIndex),
              child: screens[currentIndex],
            ),
          ),

          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: CustomNavBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
