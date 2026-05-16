import 'package:flutter/material.dart';

import '../../core/config/theme/app_colors.dart';

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  final Color? backgroundColor;
  final Color? textColor;

  final IconData? icon;
  final bool iconRight;

  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.icon,
    required this.iconRight,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  double _scale = 1.0;
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.96;
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
      _isPressed = false;
    });

    widget.onTap();
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.backgroundColor ?? AppColors.kDarkBrown;
    final textColor = widget.textColor ?? AppColors.kWhite;

    return GestureDetector(
      onTapUp: _onTapUp,
      onTapDown: _onTapDown,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 120),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..scale(_scale),
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: bgColor.withOpacity(0.4),
                    blurRadius: 25,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null && !widget.iconRight) ...[
              Icon(widget.icon, color: textColor, size: 18),
              const SizedBox(width: 8),
            ],

            Text(
              widget.text,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.kWhite),
            ),

            if (widget.icon != null && widget.iconRight) ...[
              const SizedBox(width: 8),
              Icon(widget.icon, color: textColor, size: 18),
            ],
          ],
        ),
      ),
    );
  }
}
