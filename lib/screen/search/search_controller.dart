import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docvault/utils/app_strings.dart';

import '../../models/document_model.dart';

/// Renamed from [SearchController] to [DocSearchController] to avoid a name
/// clash with Flutter's built-in [SearchController] from search_anchor.dart.
class DocSearchController extends GetxController {
  final searchTextController = TextEditingController();
  final RxString query = ''.obs;
  final RxInt selectedFilter = 0.obs;

  final List<String> filterLabels = const [
    AppStrings.searchFilterPdfs,
    AppStrings.searchFilterImages,
    AppStrings.searchFilterLast30,
  ];

  final List<IconData> filterIcons = const [
    Icons.picture_as_pdf_outlined,
    Icons.image_outlined,
    Icons.calendar_today_outlined,
  ];

  final List<SearchResultModel> results = const [
    SearchResultModel(
      id: 's1',
      fileName: 'Q4_Tax_Returns_2023.pdf',
      date: 'Oct 12, 2023',
      size: '2.4 MB',
      hasShieldBadge: true,
    ),
    SearchResultModel(
      id: 's2',
      fileName: 'Property_Deed_Scan.jpg',
      date: 'Sep 28, 2023',
      size: '5.1 MB',
      hasShieldBadge: true,
    ),
    SearchResultModel(
      id: 's3',
      fileName: 'Tax_W2_Final.pdf',
      date: 'Aug 15, 2023',
      size: '1.1 MB',
    ),
  ];

  void onQueryChanged(String v) => query.value = v;

  void onFilterSelected(int index) => selectedFilter.value = index;

  void onClear() {
    searchTextController.clear();
    query.value = '';
  }

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }
}