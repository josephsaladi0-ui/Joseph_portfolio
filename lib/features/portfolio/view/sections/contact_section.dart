import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/glass_container.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: AppConstants.contactEmail,
      queryParameters: {
        'subject': 'Collaboration Opportunity',
      },
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch email');
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Simulate form submission
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.surfaceContainer,
          title: Text(
            "Message Sent!",
            style: AppTypography.headlineLargeMobile.copyWith(color: AppColors.primary),
          ),
          content: Text(
            "Thank you, ${_nameController.text}. Your message has been sent successfully. Joseph will get back to you shortly!",
            style: AppTypography.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
              },
              child: Text(
                "OK",
                style: AppTypography.labelMono.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    // Left Contact Details Column
    Widget contactDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Build Something Amazing",
          style: AppTypography.headlineLarge.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "I'm currently looking for new opportunities to collaborate on Flutter projects. Reach out via email or find me on social platforms.",
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        
        // Email Link
        _ContactInfoRow(
          icon: Icons.mail,
          label: AppConstants.contactEmail,
          onTap: _launchEmail,
        ),
        const SizedBox(height: 16),
        
        // Phone
        const _ContactInfoRow(
          icon: Icons.call,
          label: AppConstants.contactPhone,
        ),
        const SizedBox(height: 16),
        
        // Location
        const _ContactInfoRow(
          icon: Icons.location_on,
          label: AppConstants.contactLocation,
        ),
      ],
    );

    // Right Form Column inside a Slate Background Container
    Widget contactForm = Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name Field
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            // Email Field
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email';
                }
                final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegExp.hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            // Message Field
            TextFormField(
              controller: _messageController,
              decoration: const InputDecoration(
                labelText: "Message",
                alignLabelWithHint: true,
              ),
              maxLines: 4,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            
            // Submit Button
            CustomButton.primary(
              label: "Send Message",
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );

    return GlassContainer(
      padding: const EdgeInsets.all(32),
      enableHoverEffect: false,
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                contactDetails,
                const SizedBox(height: 48),
                contactForm,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 12, child: contactDetails),
                const SizedBox(width: 48),
                Expanded(flex: 10, child: contactForm),
              ],
            ),
    );
  }
}

class _ContactInfoRow extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _ContactInfoRow({
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  State<_ContactInfoRow> createState() => _ContactInfoRowState();
}

class _ContactInfoRowState extends State<_ContactInfoRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _isHovered && widget.onTap != null
                ? AppColors.primary
                : AppColors.surfaceContainerHigh,
            shape: BoxShape.circle,
          ),
          child: Icon(
            widget.icon,
            size: 20,
            color: _isHovered && widget.onTap != null
                ? AppColors.onPrimary
                : AppColors.primary,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          widget.label,
          style: AppTypography.labelMono.copyWith(
            color: _isHovered && widget.onTap != null
                ? AppColors.primary
                : AppColors.onSurfaceVariant,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    if (widget.onTap != null) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: _isHovered
                ? Matrix4.translationValues(4, 0, 0)
                : Matrix4.identity(),
            child: content,
          ),
        ),
      );
    }

    return content;
  }
}
