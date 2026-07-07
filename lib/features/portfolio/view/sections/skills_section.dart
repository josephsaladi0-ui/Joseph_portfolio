import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/skill_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const skills = [
      "Flutter",
      "Dart",
      "UI/UX Design",
      "Git & GitHub",
      "Firebase",
      "REST APIs",
      "State Management",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          children: [
            const Icon(
              Icons.bolt,
              color: AppColors.primary,
              size: 28,
            ),
            const SizedBox(width: 12),
            Text(
              "Technical Arsenal",
              style: AppTypography.headlineLarge.copyWith(
                color: AppColors.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        
        // Skill Chips Wrap
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: skills.map((skill) => SkillChip(label: skill)).toList(),
        ),
      ],
    );
  }
}
