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

  // ── Mock data — replace with repository calls ────────────────────────────

  final String userName = 'Alex Rivera';

  String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return AppStrings.homeGoodMorning;
    if (hour < 17) return AppStrings.homeGoodAfternoon;
    return AppStrings.homeGoodEvening;
  }

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
      fileName: 'Mortgage_...',
      date: 'Modified 5h ago',
      size: '',
      fileIcon: Icons.picture_as_pdf_rounded,
      fileIconColor: Color(0xFF6B7280),
      fileIconBg: Color(0xFFF3F4F6),
    ),
  ];

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
    ),
  ];

  final List<String> filterLabels = const [
    AppStrings.homeFilterAll,
    AppStrings.homeFilterPersonal,
    AppStrings.homeFilterFinance,
    AppStrings.homeFilterMedical,
  ];

  final RxInt selectedFilter = 0.obs;
  void onFilterChanged(int index) => selectedFilter.value = index;
}