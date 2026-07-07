import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class GlassContainer extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final bool enableHoverEffect;
  final BorderSide? leftBorderOverride;

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.enableHoverEffect = true,
    this.leftBorderOverride,
  });

  @override
  State<GlassContainer> createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final defaultRadius = widget.borderRadius ?? BorderRadius.circular(12);

    Widget container = AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      margin: widget.margin,
      transform: widget.enableHoverEffect && _isHovered
          ? Matrix4.translationValues(0, -4, 0)
          : Matrix4.identity(),
      decoration: BoxDecoration(
        color: _isHovered
            ? const Color(0xFF1E293B).withOpacity(0.9)
            : const Color(0xFF1E293B).withOpacity(0.8),
        borderRadius: defaultRadius,
        border: Border(
          top: BorderSide(
            color: _isHovered
                ? AppColors.primary
                : AppColors.outlineVariant.withOpacity(0.5),
            width: 1,
          ),
          right: BorderSide(
            color: _isHovered
                ? AppColors.primary
                : AppColors.outlineVariant.withOpacity(0.5),
            width: 1,
          ),
          bottom: BorderSide(
            color: _isHovered
                ? AppColors.primary
                : AppColors.outlineVariant.withOpacity(0.5),
            width: 1,
          ),
          left:
              widget.leftBorderOverride ??
              BorderSide(
                color: _isHovered
                    ? AppColors.primary
                    : AppColors.outlineVariant.withOpacity(0.5),
                width: 1,
              ),
        ),
        boxShadow: widget.enableHoverEffect && _isHovered
            ? [
                BoxShadow(
                  color: AppColors.primaryContainer.withOpacity(0.15),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ]
            : [],
      ),
      child: ClipRRect(
        borderRadius: defaultRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: widget.child,
        ),
      ),
    );

    if (widget.enableHoverEffect) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: container,
      );
    }

    return container;
  }
}
