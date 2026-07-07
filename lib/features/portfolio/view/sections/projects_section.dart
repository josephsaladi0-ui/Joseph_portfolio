import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../models/project_model.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    final projects = [
      const ProjectModel(
        title: "BookMyShow Clone",
        description: "Built the complete UI including home screen, movie listings, search and navigation using Flutter & Dart.",
        assetPath: AppConstants.projectBookMyShowAsset,
        tags: ["Flutter", "Dart"],
        projectUrl: AppConstants.githubUrl,
      ),
      const ProjectModel(
        title: "Aas-Paas — Grocery App",
        description: "Built 12-screen hyperlocal grocery delivery app UI including splash, home, store detail, and cart screens.",
        assetPath: AppConstants.projectAasPaasAsset,
        tags: ["UI/UX", "Navigation"],
        projectUrl: AppConstants.githubUrl,
      ),
      const ProjectModel(
        title: "Admin Dashboard App",
        description: "Built an admin-style dashboard UI with data cards, structured layout, and screen navigation components.",
        icon: Icons.dashboard,
        tags: ["UI Layout", "Admin Dash"],
        projectUrl: AppConstants.githubUrl,
      ),
      const ProjectModel(
        title: "Calculator App",
        description: "Built a fully functional calculator app with all arithmetic operations and clean, minimalist UI design.",
        icon: Icons.calculate,
        tags: ["Logic", "Minimalist"],
        projectUrl: AppConstants.githubUrl,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.code,
                  color: AppColors.primary,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  "Featured Projects",
                  style: AppTypography.headlineLarge.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // GitHub Redirect
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => _launchUrl(AppConstants.githubUrl),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "View All on GitHub",
                      style: AppTypography.labelMono.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.open_in_new,
                      size: 14,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Grid of Projects
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 2,
            crossAxisSpacing: AppConstants.gutter,
            mainAxisSpacing: AppConstants.gutter,
            mainAxisExtent: 380, // Fixed height for alignment
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return _ProjectCard(project: projects[index], onTap: _launchUrl);
          },
        ),
      ],
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final Function(String) onTap;

  const _ProjectCard({
    required this.project,
    required this.onTap,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    Widget topPart;
    
    if (widget.project.assetPath != null) {
      // Image project
      topPart = Expanded(
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedScale(
                scale: _isHovered ? 1.08 : 1.0,
                duration: const Duration(milliseconds: 400),
                child: Image.asset(
                  widget.project.assetPath!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Bottom Gradient Overlay matching design
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.background,
                      AppColors.background.withOpacity(0.0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      // Icon-only project
      topPart = Expanded(
        child: Container(
          color: AppColors.surfaceContainerHigh.withOpacity(0.3),
          alignment: Alignment.center,
          child: Icon(
            widget.project.icon,
            size: 64,
            color: _isHovered ? AppColors.primary : AppColors.outline,
          ),
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          if (widget.project.projectUrl != null) {
            widget.onTap(widget.project.projectUrl!);
          }
        },
        child: GlassContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              topPart,
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: AppTypography.headlineLargeMobile.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.project.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Tags row
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.tags
                          .map(
                            (tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                tag,
                                style: AppTypography.labelMono.copyWith(
                                  color: AppColors.primary,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
