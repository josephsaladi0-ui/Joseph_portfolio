import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/glass_container.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          children: [
            const Icon(
              Icons.person_search,
              color: AppColors.primary,
              size: 28,
            ),
            const SizedBox(width: 12),
            Text(
              "Profile Summary",
              style: AppTypography.headlineLarge.copyWith(
                color: AppColors.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        
        // Content Card
        const GlassContainer(
          padding: EdgeInsets.all(24),
          enableHoverEffect: false,
          child: Text(
            "Aspiring Flutter Developer with hands-on experience building cross-platform mobile app UIs using Flutter and Dart. Currently working at Quantum Works Private Limited, Hyderabad as a Software Developer, building real-world app UIs including a BookMyShow clone, hyperlocal grocery delivery app, and admin dashboard. Proficient in widget-based UI development, screen navigation, and responsive layouts. Quick learner committed to writing clean, efficient, and user-friendly mobile applications.",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.onSurfaceVariant,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
