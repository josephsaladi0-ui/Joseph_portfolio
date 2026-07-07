import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class SkillChip extends StatefulWidget {
  final String label;

  const SkillChip({
    super.key,
    required this.label,
  });

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.primary
              : AppColors.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(9999), // pill shape
        ),
        child: Text(
          widget.label,
          style: AppTypography.labelMono.copyWith(
            color: _isHovered ? AppColors.onPrimary : AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
