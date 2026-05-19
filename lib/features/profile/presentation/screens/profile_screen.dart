import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:coffee_ui/features/profile/presentation/widgets/profile_screen_header_section.dart';
import 'package:coffee_ui/shared/app_widgets/buttons/app_button.dart';
import 'package:coffee_ui/shared/app_widgets/slide_up_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,

      body: Column(
        children: [
          ProfileScreenHeaderSection(),
          SizedBox(height: 24.h),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    /// Stats
                    Row(
                      children: [
                        Expanded(child: _statCard(context, '12', 'Orders')),

                        SizedBox(width: 14.w),

                        Expanded(child: _statCard(context, '24', 'Favorites')),

                        SizedBox(width: 14.w),

                        Expanded(child: _statCard(context, '240', 'Points')),
                      ],
                    ),

                    SizedBox(height: 28.h),

                    /// Menu
                    Column(
                      children: [
                        _menuTile(
                          icon: Icons.person_outline,
                          title: 'Personal Information',
                        ),

                        _menuTile(icon: Icons.history, title: 'Order History'),

                        _menuTile(
                          icon: Icons.favorite_border,
                          title: 'Favorites',
                        ),

                        _menuTile(
                          icon: Icons.location_on_outlined,
                          title: 'Delivery Address',
                        ),

                        _menuTile(
                          icon: Icons.notifications_none,
                          title: 'Notifications',
                        ),

                        _menuTile(
                          icon: Icons.settings_outlined,
                          title: 'Settings',
                        ),
                      ],
                    ),

                    SizedBox(height: 30.h),

                    /// Logout
                    AppButton(text: 'LogOut', onTap: () {}, iconRight: false),

                    SizedBox(height: 120.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(BuildContext context, String number, String label) {
    return SlideUpAnimation(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.h),
      
        decoration: BoxDecoration(
          color: AppColors.kDarkBrown,
      
          borderRadius: BorderRadius.circular(20.r),
        ),
      
        child: Column(
          children: [
            Text(
              number,
      
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.kCaramel,
                fontWeight: FontWeight.bold,
              ),
            ),
      
            SizedBox(height: 5.h),
      
            Text(
              label,
      
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.kCream),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuTile({required IconData icon, required String title}) {
    return SlideUpAnimation(
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
      
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      
        decoration: BoxDecoration(
          color: AppColors.kWhite,
      
          borderRadius: BorderRadius.circular(20.r),
        ),
      
        child: Row(
          children: [
            Icon(icon, color: AppColors.kCaramel),
      
            SizedBox(width: 14.w),
      
            Expanded(child: Text(title)),
      
            Icon(Icons.arrow_forward_ios, size: 16.sp),
          ],
        ),
      ),
    );
  }
}
