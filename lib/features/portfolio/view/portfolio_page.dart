import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/constants.dart';
import 'sections/about_section.dart';
import 'sections/contact_section.dart';
import 'sections/drawer_navigation.dart';
import 'sections/education_section.dart';
import 'sections/experience_section.dart';
import 'sections/footer_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'sections/top_app_bar.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Global keys for scroll targets
  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    if (index == -1) {
      // Scroll to top
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
      return;
    }

    final key = _sectionKeys[index];
    final context = key.currentContext;
    if (context != null) {
      final box = context.findRenderObject() as RenderBox?;
      if (box != null) {
        final position = box.localToGlobal(Offset.zero);
        // Scroll offset adjusted for fixed header height (80.0) + extra spacing (16.0)
        final scrollOffset = _scrollController.offset + position.dy - 96.0;

        _scrollController.animateTo(
          scrollOffset.clamp(0.0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: DrawerNavigation(onNavItemTap: _scrollToSection),
      body: Stack(
        children: [
          // Scrollable Content
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: AppConstants.appBarHeight),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: AppConstants.maxContentWidth,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.gutter,
                      ),
                      child: Column(
                        children: [
                          HeroSection(
                            onContactTap: () => _scrollToSection(4), // Contact is 4
                            onViewProjectsTap: () => _scrollToSection(2), // Projects is 2
                          ),
                          const SizedBox(height: 80),
                          
                          AboutSection(key: _sectionKeys[0]), // About is 0
                          const SizedBox(height: 48),
                          
                          const SkillsSection(), // Skills is grouped with About
                          const SizedBox(height: 80),
                          
                          ExperienceSection(key: _sectionKeys[1]), // Experience is 1
                          const SizedBox(height: 80),
                          
                          ProjectsSection(key: _sectionKeys[2]), // Projects is 2
                          const SizedBox(height: 80),
                          
                          EducationSection(key: _sectionKeys[3]), // Education is 3
                          const SizedBox(height: 80),
                          
                          ContactSection(key: _sectionKeys[4]), // Contact is 4
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                  const FooterSection(),
                ],
              ),
            ),
          ),

          // Fixed Top App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TopAppBar(
              onNavItemTap: _scrollToSection,
              onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ),
        ],
      ),
    );
  }
}
