import 'package:coffee_ui/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatefulWidget {
  final String? label;
  final String hint;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;

  const AppTextField({
    super.key,
    this.label,
    required this.hint,
    required this.isPassword,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          if (widget.label != null)
            Text(widget.label!, style: Theme.of(context).textTheme.bodyMedium),

          if (widget.label != null) SizedBox(height: 8.h),

          TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: _obscure,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.kCaramel),
            cursorColor: AppColors.kCaramel,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon, color: AppColors.kCaramel)
                  : null,
              hintText: widget.hint,
              hintStyle: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.kCaramel),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(color: AppColors.kDarkBrown),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(color: AppColors.kCoffeeBrown),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(color: AppColors.kCaramel),
              ),
              fillColor: AppColors.kCaramel.withOpacity(0.18),
              filled: true,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.kCaramel,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
