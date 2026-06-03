import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docvault/utils/app_colors.dart';
import 'package:docvault/utils/app_strings.dart';
import 'package:docvault/widgets/doc_list_tile.dart';

import '../../models/document_model.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DashboardController — owns bottom nav index + shared document data
// ─────────────────────────────────────────────────────────────────────────────
class DashboardController extends GetxController {
  final RxInt currentTabIndex = 0.obs;

  void onTabChanged(int index) => currentTabIndex.value = index;

  // ── User ─────────────────────────────────────────────────────────────────
  final String userName = 'Alex Rivera';

  String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return AppStrings.homeGoodMorning;
    if (hour < 17) return AppStrings.homeGoodAfternoon;
    return AppStrings.homeGoodEvening;
  }

  // ── Recent Documents (not filtered) ──────────────────────────────────────
  final List<DocumentModel> recentDocuments = const [
    DocumentModel(
      id: 'r1',
      fileName: 'Q3_Tax_Return_2023.pdf',
      date: 'Modified 2h ago',
      size: '4.2 MB',
      fileIcon: Icons.picture_as_pdf_rounded,
      fileIconColor: Color(0xFFEF4444),
      fileIconBg: Color(0xFFFEE2E2),
      isEncrypted: true,
    ),
    DocumentModel(
      id: 'r2',
      fileName: 'Mortgage_Agreement.pdf',
      date: 'Modified 5h ago',
      size: '2.1 MB',
      fileIcon: Icons.picture_as_pdf_rounded,
      fileIconColor: Color(0xFF6B7280),
      fileIconBg: Color(0xFFF3F4F6),
    ),
  ];

  // ── All Documents (source of truth) ──────────────────────────────────────
  final List<DocumentModel> allDocuments = const [
    DocumentModel(
      id: 'd1',
      fileName: 'Passport_Scan_Main.jpg',
      date: 'Oct 12, 2023',
      size: '2.4 MB',
      fileIcon: Icons.insert_drive_file_outlined,
      fileIconColor: AppColors.primary,
      fileIconBg: AppColors.primarySurface,
      tagType: DocTagType.identity,
      category: 'personal',
    ),
    DocumentModel(
      id: 'd2',
      fileName: 'Medical_Record_Summary.pdf',
      date: 'Sep 28, 2023',
      size: '12.7 MB',
      fileIcon: Icons.picture_as_pdf_rounded,
      fileIconColor: Color(0xFFEF4444),
      fileIconBg: Color(0xFFFEE2E2),
      tagType: DocTagType.health,
      category: 'medical',
    ),
    DocumentModel(
      id: 'd3',
      fileName: 'Rental_Agreement_Signed.png',
      date: 'Sep 15, 2023',
      size: '3.1 MB',
      fileIcon: Icons.image_outlined,
      fileIconColor: Color(0xFFF59E0B),
      fileIconBg: Color(0xFFFEF3C7),
      tagType: DocTagType.legal,
      category: 'finance',
    ),
    DocumentModel(
      id: 'd4',
      fileName: 'Unrecognized_Scan_001.jpg',
      date: 'Yesterday',
      size: '450 KB',
      fileIcon: Icons.warning_amber_rounded,
      fileIconColor: Color(0xFFEF4444),
      fileIconBg: Color(0xFFFEE2E2),
      tagType: DocTagType.action,
      category: 'personal',
    ),
    DocumentModel(
      id: 'd5',
      fileName: 'Salary_Slip_Oct_2023.pdf',
      date: 'Oct 1, 2023',
      size: '1.2 MB',
      fileIcon: Icons.picture_as_pdf_rounded,
      fileIconColor: Color(0xFF10B981),
      fileIconBg: Color(0xFFD1FAE5),
      tagType: DocTagType.identity,
      category: 'finance',
    ),
    DocumentModel(
      id: 'd6',
      fileName: 'Vaccination_Certificate.pdf',
      date: 'Aug 20, 2023',
      size: '0.8 MB',
      fileIcon: Icons.picture_as_pdf_rounded,
      fileIconColor: Color(0xFF6366F1),
      fileIconBg: Color(0xFFE0E7FF),
      tagType: DocTagType.health,
      category: 'medical',
    ),
  ];

  // ── Filter chips ──────────────────────────────────────────────────────────
  final List<String> filterLabels = const [
    AppStrings.homeFilterAll,
    AppStrings.homeFilterPersonal,
    AppStrings.homeFilterFinance,
    AppStrings.homeFilterMedical,
  ];

  final RxInt selectedFilter = 0.obs;

  void onFilterChanged(int index) => selectedFilter.value = index;

  /// Returns the subset of [allDocuments] matching the active chip.
  /// Wrapped in a getter so [Obx] can observe [selectedFilter] automatically.
  List<DocumentModel> get filteredDocuments {
    switch (selectedFilter.value) {
      case 1: // Personal
        return allDocuments
            .where((d) => d.category == 'personal')
            .toList();
      case 2: // Finance
        return allDocuments
            .where((d) => d.category == 'finance')
            .toList();
      case 3: // Medical
        return allDocuments
            .where((d) => d.category == 'medical')
            .toList();
      default: // All
        return allDocuments;
    }
  }
}