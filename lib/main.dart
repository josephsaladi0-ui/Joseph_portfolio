import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/portfolio/view/portfolio_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joseph Saladi | Flutter Developer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioPage(),
    );
  }
}
