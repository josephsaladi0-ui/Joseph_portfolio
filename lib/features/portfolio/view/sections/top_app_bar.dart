import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/widgets/custom_button.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onNavItemTap;
  final VoidCallback onMenuTap;

  const TopAppBar({
    super.key,
    required this.onNavItemTap,
    required this.onMenuTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(AppConstants.appBarHeight);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      height: AppConstants.appBarHeight,
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.8),
        border: const Border(
          bottom: BorderSide(
            color: Color(0x1B8C90A0), // border-outline-variant/30 equivalent
            width: 1,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: AppConstants.maxContentWidth,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile
              ? AppConstants.gutter / 1.5
              : AppConstants.gutter,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => onNavItemTap(-1), // scroll to top/hero
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.terminal,
                      color: AppColors.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "JS.dev",
                      style: AppTypography.displayLarge.copyWith(
                        fontSize: 24,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: [AppColors.primary, AppColors.secondary],
                          ).createShader(const Rect.fromLTWH(0, 0, 100, 24)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Navigation Links (Desktop/Tablet)
            if (!isMobile)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _NavBarItem(label: "About", onTap: () => onNavItemTap(0)),
                  const SizedBox(width: 32),
                  _NavBarItem(
                    label: "Experience",
                    onTap: () => onNavItemTap(1),
                  ),
                  const SizedBox(width: 32),
                  _NavBarItem(label: "Projects", onTap: () => onNavItemTap(2)),
                  const SizedBox(width: 32),
                  _NavBarItem(label: "Contact", onTap: () => onNavItemTap(3)),
                  const SizedBox(width: 32),
                  CustomButton.secondary(
                    label: "Resume",
                    onPressed: () {
                      // Clicked Resume
                    },
                  ),
                ],
              )
            else
              // Mobile Action
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton.secondary(
                    label: "Resume",
                    onPressed: () {
                      // Clicked Resume
                    },
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.menu, color: AppColors.onSurface),
                    onPressed: onMenuTap,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavBarItem({required this.label, required this.onTap});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: AppTypography.labelMono.copyWith(
            color: _isHovered ? AppColors.primary : AppColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
