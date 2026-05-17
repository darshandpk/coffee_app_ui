import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:coffee_ui/shared/app_widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenHeader extends StatefulWidget {
  final String userName;
  const HomeScreenHeader({super.key, required this.userName});

  @override
  State<HomeScreenHeader> createState() => _HomeScreenHeaderState();
}

class _HomeScreenHeaderState extends State<HomeScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 50.h),
      decoration: BoxDecoration(
        color: AppColors.kDarkBrown,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 23.r,
                    child: Icon(Icons.person, color: AppColors.kCaramel),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, ${widget.userName}',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: AppColors.kWhite),
                      ),
                      Text(
                        'what would you like?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.kCaramel),
                ),
                child: Icon(Icons.notifications, color: AppColors.kCaramel),
              ),
            ],
          ),
          AppTextField(
            prefixIcon: Icons.search,
            hint: 'Search for Coffee',
            isPassword: false,
          ),
        ],
      ),
    );
  }
}
