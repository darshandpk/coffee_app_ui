import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color? bgColor;
  final VoidCallback onTap;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.kCaramel.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: onTap,
          icon: Icon(icon),
          color: bgColor ?? AppColors.kCream,
        ),
      ),
    );
  }
}
