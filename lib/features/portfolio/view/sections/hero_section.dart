import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/widgets/custom_button.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactTap;
  final VoidCallback onViewProjectsTap;

  const HeroSection({
    super.key,
    required this.onContactTap,
    required this.onViewProjectsTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    // Left Column Content
    Widget textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "AVAILABLE FOR WORK",
          style: AppTypography.labelMono.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 16),
        RichText(
              text: TextSpan(
                style:
                    (isMobile
                            ? AppTypography.headlineLargeMobile
                            : AppTypography.displayLarge)
                        .copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                        ),
                children: [
                  const TextSpan(text: "Crafting High-Performance "),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: ShaderMask(
                      shaderCallback: (bounds) =>
                          const LinearGradient(
                            colors: [
                              AppColors.primaryGradientStart,
                              AppColors.primaryGradientEnd,
                            ],
                          ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                      child: Text(
                        "Cross-Platform",
                        style:
                            (isMobile
                                    ? AppTypography.headlineLargeMobile
                                    : AppTypography.displayLarge)
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                      ),
                    ),
                  ),
                  const TextSpan(text: " Experiences"),
                ],
              ),
            )
            .animate()
            .fadeIn(delay: 200.ms, duration: 600.ms)
            .slideY(begin: 0.1, end: 0),
        const SizedBox(height: 16),
        Text(
          "Hi, I'm Joseph Saladi. A dedicated Flutter Developer passionate about building clean, efficient, and user-friendly mobile applications.",
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.onSurfaceVariant,
            fontSize: isMobile ? 15 : 18,
          ),
        ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            CustomButton.primary(label: "Let's Talk", onPressed: onContactTap),
            CustomButton.secondary(
              label: "View Projects",
              onPressed: onViewProjectsTap,
            ),
          ],
        ).animate().fadeIn(delay: 600.ms, duration: 600.ms),
      ],
    );

    // Right Column Image
    Widget imageContent = Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Glow Animation
          Container(
                width: isMobile ? 220 : 340,
                height: isMobile ? 220 : 340,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scale(
                begin: const Offset(0.9, 0.9),
                end: const Offset(1.05, 1.05),
                duration: 2.seconds,
                curve: Curves.easeInOut,
              )
              .blur(
                begin: const Offset(30, 30),
                end: const Offset(50, 50),
                duration: 2.seconds,
                curve: Curves.easeInOut,
              )
              .custom(
                builder: (context, val, child) =>
                    Opacity(opacity: val * 0.25, child: child),
              ),

          // Image Border & Box
          Container(
            width: isMobile ? 200 : 320,
            height: isMobile ? 200 : 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.outlineVariant.withOpacity(0.3),
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            padding: const EdgeInsets.all(4),
            child: ClipOval(
              child: Image.asset(AppConstants.profileAsset, fit: BoxFit.cover),
            ),
          ).animate().fadeIn(delay: 300.ms, duration: 700.ms),
        ],
      ),
    );

    return Container(
      constraints: const BoxConstraints(minHeight: 500),
      padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 80),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [imageContent, const SizedBox(height: 48), textContent],
            )
          : Row(
              children: [
                Expanded(flex: 12, child: textContent),
                const SizedBox(width: 48),
                Expanded(flex: 10, child: imageContent),
              ],
            ),
    );
  }
}
