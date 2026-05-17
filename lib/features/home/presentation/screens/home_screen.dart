import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:coffee_ui/features/home/data/dummy/coffee_dummy_data.dart';
import 'package:coffee_ui/features/home/presentation/widgets/coffee_category_widget.dart';
import 'package:coffee_ui/features/home/presentation/widgets/coffee_list_widget.dart';
import 'package:coffee_ui/features/home/presentation/widgets/home_screen_header.dart';
import 'package:coffee_ui/features/home/presentation/widgets/popular_coffee_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All Coffee';

  @override
  Widget build(BuildContext context) {
    final coffees = CoffeeDummyData.coffees;
    final filteredCoffee = selectedCategory == 'All Coffee'
        ? coffees
        : coffees.where((coffee) {
            return coffee.category == selectedCategory;
          }).toList();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.kBackground,
        body: Column(
          children: [
            HomeScreenHeader(userName: 'Darshan'),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    CoffeeCategoryWidget(
                      selectedCategory: selectedCategory,
                      onCategorySelected: (category) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                    SizedBox(height: 20.h),
                    CoffeeListWidget(coffeeModel: filteredCoffee),
                    SizedBox(height: 20.h),
                    PopularCoffeeSection(),
                    SizedBox(height: 80.h,)
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
