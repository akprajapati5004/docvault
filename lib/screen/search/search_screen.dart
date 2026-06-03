import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docvault/utils/app_colors.dart';
import 'package:docvault/utils/app_strings.dart';
import 'package:docvault/widgets/doc_app_bar.dart';
import 'package:docvault/widgets/doc_chip.dart';

import '../../models/document_model.dart';
import 'search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DocSearchController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: DocAppBar(
        variant: DocAppBarVariant.search,
        searchController: controller.searchTextController,
        searchHint: AppStrings.searchHint,
        onSearchChanged: controller.onQueryChanged,
        onSearchClear: controller.onClear,
        onNotificationTap: () {},
      ),
      body: CustomScrollView(
        slivers: [
          // ── Filter chips ────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Obx(() => DocChipRow(
                labels: controller.filterLabels,
                icons: controller.filterIcons,
                selectedIndex: controller.selectedFilter.value,
                onSelected: controller.onFilterSelected,
                padding: const EdgeInsets.symmetric(horizontal: 20),
              )),
            ),
          ),

          // ── Results header ───────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    AppStrings.searchResults,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    '${controller.results.length} ${AppStrings.searchItemsFound}',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textCaption,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Results grid — 2 columns ────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.78,
              ),
              delegate: SliverChildBuilderDelegate(
                    (_, i) => _SearchResultCard(model: controller.results[i]),
                childCount: controller.results.length,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Search result card — thumbnail + shield badge + filename + meta
// ─────────────────────────────────────────────────────────────────────────────
class _SearchResultCard extends StatelessWidget {
  const _SearchResultCard({required this.model});
  final SearchResultModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(color: const Color(0xFFE5E7EB)),
                    const Center(
                      child: Icon(Icons.image_outlined,
                          size: 36, color: Color(0xFFD1D5DB)),
                    ),
                    if (model.hasShieldBadge)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.shield_rounded,
                              size: 14, color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // File info
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.fileName,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${model.date}  •  ${model.size}',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textCaption,
                      height: 1.4,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}