import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../models/education_model.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    const btechModel = EducationModel(
      degree: "B.Tech (Electrical and Electronics)",
      institution: "Pragati Engineering College, Surampalem",
      period: "2025",
      grade: "Grade: 7/10",
      type: EducationType.primary,
    );

    const twelfthModel = EducationModel(
      degree: "Class XII",
      institution: "Andhra Pradesh",
      period: "2021",
      grade: "Grade: 75-79.9%",
      additionalInfo: "Medium: English",
      type: EducationType.secondary,
    );

    const tenthModel = EducationModel(
      degree: "Class X",
      institution: "Andhra Pradesh",
      period: "2019",
      grade: "Grade: 95-99.9%",
      additionalInfo: "Medium: English",
      type: EducationType.outline,
    );

    BorderSide getLeftBorder(EducationType type) {
      Color borderClr;
      switch (type) {
        case EducationType.primary:
          borderClr = AppColors.primary;
          break;
        case EducationType.secondary:
          borderClr = AppColors.secondary;
          break;
        case EducationType.outline:
          borderClr = AppColors.outline;
          break;
      }
      return BorderSide(color: borderClr, width: 4);
    }

    Widget buildEducationCard(EducationModel edu, {bool isLarge = false}) {
      return GlassContainer(
        padding: const EdgeInsets.all(24),
        leftBorderOverride: getLeftBorder(edu.type),
        enableHoverEffect: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: isLarge ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Text(
              edu.degree,
              style: (isLarge ? AppTypography.headlineLargeMobile : AppTypography.bodyMediumBold).copyWith(
                color: AppColors.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${edu.institution}  |  ${edu.period}",
              style: AppTypography.labelMono.copyWith(
                color: edu.type == EducationType.primary
                    ? AppColors.primary
                    : AppColors.onSurfaceVariant,
                fontSize: 13,
              ),
            ),
            if (edu.additionalInfo != null) ...[
              const SizedBox(height: 8),
              Text(
                edu.additionalInfo!,
                style: AppTypography.labelMono.copyWith(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 13,
                ),
              ),
            ],
            const SizedBox(height: 8),
            Text(
              edu.grade,
              style: AppTypography.labelMono.copyWith(
                color: AppColors.onSurfaceVariant,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }

    // Grid layout for Desktop
    Widget desktopContent = Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column (B.Tech)
        Expanded(
          child: buildEducationCard(btechModel, isLarge: true),
        ),
        const SizedBox(width: AppConstants.gutter),
        
        // Right Column (Class XII & Class X stacked)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: buildEducationCard(twelfthModel)),
              const SizedBox(height: AppConstants.gutter),
              Expanded(child: buildEducationCard(tenthModel)),
            ],
          ),
        ),
      ],
    );

    // Stacked layout for Mobile
    Widget mobileContent = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildEducationCard(btechModel, isLarge: true),
        const SizedBox(height: 24),
        buildEducationCard(twelfthModel),
        const SizedBox(height: 24),
        buildEducationCard(tenthModel),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          children: [
            const Icon(
              Icons.school,
              color: AppColors.primary,
              size: 28,
            ),
            const SizedBox(width: 12),
            Text(
              "Education History",
              style: AppTypography.headlineLarge.copyWith(
                color: AppColors.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        
        // Content Area
        IntrinsicHeight(
          child: isMobile ? mobileContent : desktopContent,
        ),
      ],
    );
  }
}
