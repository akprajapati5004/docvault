import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docvault/utils/app_colors.dart';
import 'package:docvault/utils/app_strings.dart';

import '../../models/document_model.dart';

class CategoriesController extends GetxController {
  final filterController = TextEditingController();
  final RxString filterQuery = ''.obs;

  final List<CategoryModel> categories = const [
    CategoryModel(
      id: 'personal',
      name: AppStrings.categoriesPersonal,
      itemCount: 124,
      icon: Icons.person_outline_rounded,
      iconColor: AppColors.primary,
      iconBg: AppColors.primarySurface,
    ),
    CategoryModel(
      id: 'work',
      name: AppStrings.categoriesWork,
      itemCount: 89,
      icon: Icons.work_outline_rounded,
      iconColor: Color(0xFF6B7280),
      iconBg: Color(0xFFF3F4F6),
    ),
    CategoryModel(
      id: 'financial',
      name: AppStrings.categoriesFinancial,
      itemCount: 45,
      icon: Icons.account_balance_outlined,
      iconColor: Color(0xFFF59E0B),
      iconBg: Color(0xFFFEF3C7),
    ),
    CategoryModel(
      id: 'legal',
      name: AppStrings.categoriesLegal,
      itemCount: 12,
      icon: Icons.gavel_rounded,
      iconColor: Color(0xFF6B7280),
      iconBg: Color(0xFFF3F4F6),
    ),
    CategoryModel(
      id: 'medical',
      name: AppStrings.categoriesMedical,
      itemCount: 32,
      icon: Icons.medical_services_outlined,
      iconColor: Color(0xFFEF4444),
      iconBg: Color(0xFFFEE2E2),
      badge: AppStrings.categoriesRecentUpdates,
    ),
    CategoryModel(
      id: 'trash',
      name: AppStrings.categoriesTrash,
      itemCount: 18,
      icon: Icons.delete_outline_rounded,
      iconColor: Color(0xFF9CA3AF),
      iconBg: Color(0xFFF9FAFB),
      description: AppStrings.categoriesTrashNote,
    ),
  ];

  final List<AnalyticsModel> analytics = const [
    AnalyticsModel(
      label: AppStrings.analyticsTotalStorage,
      value: '12.4 GB',
      barColor: AppColors.analyticsBarBlue,
      barFraction: 0.82,
    ),
    AnalyticsModel(
      label: AppStrings.analyticsEncryptedFiles,
      value: '1,248',
      barColor: AppColors.analyticsBarOrange,
      barFraction: 0.65,
    ),
    AnalyticsModel(
      label: AppStrings.analyticsSharedFolders,
      value: '14',
      barColor: AppColors.analyticsBarBlue,
      barFraction: 0.20,
    ),
  ];

  void onFilterChanged(String v) => filterQuery.value = v;

  void onCreateNew() {}

  @override
  void onClose() {
    filterController.dispose();
    super.onClose();
  }
}