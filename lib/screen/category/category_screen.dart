import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docvault/custom_ui/custom_button.dart';
import 'package:docvault/utils/app_colors.dart';
import 'package:docvault/utils/app_strings.dart';
import 'package:docvault/widgets/doc_app_bar.dart';
import 'package:docvault/widgets/doc_search_bar.dart';

import '../../models/document_model.dart';
import 'category_controller.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoriesController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: DocAppBar(
        variant: DocAppBarVariant.logoTitle,
        title: AppStrings.appName,
        onNotificationTap: () {},
      ),
      body: CustomScrollView(
        slivers: [
          // ── Search bar ──────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: DocSearchBar(
                hint: AppStrings.categoriesFilterHint,
                controller: controller.filterController,
                onChanged: controller.onFilterChanged,
                onFilterTap: () {},
              ),
            ),
          ),

          // ── Categories header + Create New ───────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.categoriesTitle,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        AppStrings.categoriesSubtitle,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),

                  // Create New — reuses existing CustomButton
                  CustomButton(
                    label: AppStrings.categoriesCreateNew,
                    onTap: controller.onCreateNew,
                    prefixIcon: Icons.add_circle_outline_rounded,
                    fullWidth: false,
                    height: 40,
                    borderRadius: 20,
                    horizontalPadding: 16,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    iconSize: 16,
                  ),
                ],
              ),
            ),
          ),

          // ── Category grid — 2 columns ────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.05,
              ),
              delegate: SliverChildBuilderDelegate(
                    (_, i) => _CategoryCard(model: controller.categories[i]),
                childCount: controller.categories.length,
              ),
            ),
          ),

          // ── Vault Analytics header ───────────────────────────────────────
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 28, 20, 16),
              child: Text(
                AppStrings.vaultAnalytics,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textCaption,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),

          // ── Analytics bars ───────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (_, i) => _AnalyticsRow(model: controller.analytics[i]),
                childCount: controller.analytics.length,
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
// Category card
// ─────────────────────────────────────────────────────────────────────────────
class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.model});
  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item count + badge row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${model.itemCount} items',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textCaption,
                    height: 1.4,
                  ),
                ),
                if (model.badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.recentUpdatesBadge,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      model.badge!,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 12),

            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: model.iconBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(model.icon, size: 20, color: model.iconColor),
            ),

            const SizedBox(height: 10),

            // Name
            Text(
              model.name,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),

            // Description (Trash card only)
            if (model.description != null) ...[
              const SizedBox(height: 4),
              Expanded(
                child: Text(
                  model.description!,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Analytics row — label + value + coloured progress bar
// ─────────────────────────────────────────────────────────────────────────────
class _AnalyticsRow extends StatelessWidget {
  const _AnalyticsRow({required this.model});
  final AnalyticsModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.label,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                model.value,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(3),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: model.barFraction,
              child: Container(
                decoration: BoxDecoration(
                  color: model.barColor,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}