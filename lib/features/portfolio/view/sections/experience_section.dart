import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../models/experience_model.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    const experiences = [
      ExperienceModel(
        role: "Software Developer",
        duration: "04/2024 — Present",
        company: "Quantum Works Private Limited",
        location: "Hyderabad",
        bulletPoints: [
          "Undergoing hands-on Flutter and Dart training as part of an industry-level development program.",
          "Built multiple mobile app UIs including BookMyShow clone, grocery delivery app, and admin dashboard.",
          "Practiced widget-based layouts, screen navigation, and responsive UI design.",
          "Presented technical topics to peers via Microsoft Teams as part of structured training.",
        ],
      )
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          children: [
            const Icon(
              Icons.work,
              color: AppColors.primary,
              size: 28,
            ),
            const SizedBox(width: 12),
            Text(
              "Experience",
              style: AppTypography.headlineLarge.copyWith(
                color: AppColors.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 48),

        // Timeline list
        ...experiences.map((exp) => _TimelineItem(experience: exp)),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final ExperienceModel experience;

  const _TimelineItem({required this.experience});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side timeline graphic
          Column(
            children: [
              // Glowing Node
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                    )
                  ],
                ),
              ),
              // Vertical connecting line
              Expanded(
                child: Container(
                  width: 2,
                  color: AppColors.outlineVariant.withOpacity(0.3),
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
          
          // Right side details content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.role,
                    style: AppTypography.headlineLarge.copyWith(
                      fontSize: 22,
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${experience.duration}  |  ${experience.company}, ${experience.location}",
                    style: AppTypography.labelMono.copyWith(
                      color: AppColors.primary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...experience.bulletPoints.map(
                    (point) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, right: 12.0),
                            child: Icon(
                              Icons.circle,
                              size: 6,
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              point,
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.onSurfaceVariant,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
