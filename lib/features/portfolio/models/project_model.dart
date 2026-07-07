import 'package:flutter/widgets.dart';

class ProjectModel {
  final String title;
  final String description;
  final String? assetPath;
  final IconData? icon;
  final List<String> tags;
  final String? projectUrl;

  const ProjectModel({
    required this.title,
    required this.description,
    this.assetPath,
    this.icon,
    required this.tags,
    this.projectUrl,
  });
}
