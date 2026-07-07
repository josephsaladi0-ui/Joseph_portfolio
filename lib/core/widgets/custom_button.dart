import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class CustomButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;
  final IconData? icon;

  const CustomButton.primary({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  }) : isPrimary = true;

  const CustomButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  }) : isPrimary = false;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {


    Widget buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null) ...[
          Icon(
            widget.icon,
            size: 18,
            color: widget.isPrimary ? Colors.white : AppColors.primary,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          widget.label,
          style: AppTypography.labelMono.copyWith(
            color: widget.isPrimary ? Colors.white : AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    Decoration decoration;
    if (widget.isPrimary) {
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(9999),
        gradient: const LinearGradient(
          colors: [
            AppColors.primaryGradientStart,
            AppColors.primaryGradientEnd,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: AppColors.primaryGradientStart.withOpacity(0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                )
              ]
            : [],
      );
    } else {
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(
          color: AppColors.outlineVariant.withOpacity(0.5),
          width: 1,
        ),
        color: _isHovered
            ? AppColors.surfaceBright.withOpacity(0.15)
            : Colors.transparent,
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : (_isHovered ? 1.02 : 1.0),
          duration: const Duration(milliseconds: 150),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: decoration,
            child: buttonContent,
          ),
        ),
      ),
    );
  }
}
