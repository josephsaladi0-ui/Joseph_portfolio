import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/responsive_layout.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    Widget brandInfo = Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "JS.dev",
          style: AppTypography.displayLarge.copyWith(
            fontSize: 24,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "© 2024 Joseph Saladi. Built with Flutter.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.outline,
            fontSize: 14,
          ),
        ),
      ],
    );

    Widget socialLinks = Wrap(
      spacing: 24,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        _SocialLink(
          label: "GitHub",
          onTap: () => _launchUrl(AppConstants.githubUrl),
        ),
        _SocialLink(
          label: "LinkedIn",
          onTap: () => _launchUrl(AppConstants.linkedinUrl),
        ),
        _SocialLink(
          label: "Twitter",
          onTap: () => _launchUrl(AppConstants.twitterUrl),
        ),
      ],
    );

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        border: Border(
          top: BorderSide(
            color: Color(0x1B8C90A0), // border-outline-variant/20 equivalent
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40),
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: AppConstants.maxContentWidth,
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.gutter),
        child: isMobile
            ? Column(
                children: [
                  brandInfo,
                  const SizedBox(height: 24),
                  socialLinks,
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  brandInfo,
                  socialLinks,
                ],
              ),
      ),
    );
  }
}

class _SocialLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _SocialLink({
    required this.label,
    required this.onTap,
  });

  @override
  State<_SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<_SocialLink> {
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
            color: _isHovered ? AppColors.secondary : AppColors.onSurfaceVariant,
            decoration: _isHovered ? TextDecoration.underline : TextDecoration.none,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
