import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/constants.dart';

class DrawerNavigation extends StatelessWidget {
  final Function(int) onNavItemTap;

  const DrawerNavigation({
    super.key,
    required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surfaceContainerLow,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppColors.secondaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppColors.onSecondaryContainer,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppConstants.developerName,
                          style: AppTypography.headlineLargeMobile.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          AppConstants.developerTitle,
                          style: AppTypography.labelMono.copyWith(
                            color: AppColors.outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            
            // Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _DrawerItem(
                    icon: Icons.person,
                    label: "About",
                    onTap: () {
                      Navigator.pop(context);
                      onNavItemTap(0);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.work,
                    label: "Experience",
                    onTap: () {
                      Navigator.pop(context);
                      onNavItemTap(1);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.code,
                    label: "Projects",
                    onTap: () {
                      Navigator.pop(context);
                      onNavItemTap(2);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.school,
                    label: "Education",
                    onTap: () {
                      Navigator.pop(context);
                      onNavItemTap(3); // Education is linked to navigations
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.mail,
                    label: "Contact",
                    onTap: () {
                      Navigator.pop(context);
                      onNavItemTap(4);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            Icon(icon, color: AppColors.onSurfaceVariant, size: 20),
            const SizedBox(width: 16),
            Text(
              label,
              style: AppTypography.bodyMediumMedium.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
