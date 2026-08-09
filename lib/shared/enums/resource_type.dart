import 'package:flutter/material.dart';
import '../../core/theme/app_icons.dart';

/// Categorization of academic knowledge items in StudyVault.
enum ResourceType {
  paper(label: 'Research Paper', icon: AppIcons.paper),
  dataset(label: 'Dataset', icon: AppIcons.dataset),
  book(label: 'Textbook / Monograph', icon: AppIcons.book),
  code(label: 'Code / Reproducibility', icon: AppIcons.code),
  document(label: 'Document', icon: AppIcons.document);

  const ResourceType({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}
