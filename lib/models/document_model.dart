import 'package:flutter/material.dart';
import '../widgets/doc_list_tile.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DocumentModel
// ─────────────────────────────────────────────────────────────────────────────
class DocumentModel {
  const DocumentModel({
    required this.id,
    required this.fileName,
    required this.date,
    required this.size,
    required this.fileIcon,
    required this.fileIconColor,
    required this.fileIconBg,
    this.tagType,
    this.thumbnailUrl,
    this.isEncrypted = false,
    this.category = '',
  });

  final String id;
  final String fileName;
  final String date;
  final String size;
  final IconData fileIcon;
  final Color fileIconColor;
  final Color fileIconBg;
  final DocTagType? tagType;
  final String? thumbnailUrl;
  final bool isEncrypted;
  final String category;
}

// ─────────────────────────────────────────────────────────────────────────────
// CategoryModel
// ─────────────────────────────────────────────────────────────────────────────
class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.itemCount,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    this.badge,
    this.description,
  });

  final String id;
  final String name;
  final int itemCount;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String? badge;       // e.g. "2 RECENT UPDATES"
  final String? description; // shown in Trash card
}

// ─────────────────────────────────────────────────────────────────────────────
// AnalyticsModel
// ─────────────────────────────────────────────────────────────────────────────
class AnalyticsModel {
  const AnalyticsModel({
    required this.label,
    required this.value,
    required this.barColor,
    required this.barFraction, // 0.0 – 1.0
  });

  final String label;
  final String value;
  final Color barColor;
  final double barFraction;
}

// ─────────────────────────────────────────────────────────────────────────────
// SearchResultModel
// ─────────────────────────────────────────────────────────────────────────────
class SearchResultModel {
  const SearchResultModel({
    required this.id,
    required this.fileName,
    required this.date,
    required this.size,
    this.thumbnailUrl,
    this.hasShieldBadge = false,
  });

  final String id;
  final String fileName;
  final String date;
  final String size;
  final String? thumbnailUrl;
  final bool hasShieldBadge;
}