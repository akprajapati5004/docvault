import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docvault/custom_ui/custom_button.dart';
import 'package:docvault/custom_ui/custom_text.dart';
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

          // ── Header row ─────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Title + subtitle — Flexible prevents overflow on small screens
                  const Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: AppStrings.categoriesTitle,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFontFamily.poppins,
                          color: AppColors.textPrimary,
                        ),
                        SizedBox(height: 2),
                        CustomText(
                          text: AppStrings.categoriesSubtitle,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                          height: 1.4,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Create New button — always stays right-aligned
                  CustomButton(
                    label: AppStrings.categoriesCreateNew,
                    onTap: controller.onCreateNew,
                    prefixIcon: Icons.add_circle_outline_rounded,
                    fullWidth: false,
                    height: 40,
                    borderRadius: 20,
                    horizontalPadding: 14,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    iconSize: 16,
                  ),
                ],
              ),
            ),
          ),

          // ── Category grid ───────────────────────────────────────────────
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

          // ── Vault Analytics label ───────────────────────────────────────
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 28, 20, 16),
              child: CustomText(
                text: AppStrings.vaultAnalytics,
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.textCaption,
                letterSpacing: 1.2,
              ),
            ),
          ),

          // ── Analytics bars ──────────────────────────────────────────────
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
// Category card — pixel-perfect, no overflow
// ─────────────────────────────────────────────────────────────────────────────
class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.model});
  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(14),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: CustomText(
                    text: '${model.itemCount} items',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textCaption,
                    height: 1.4,
                    maxLines: 1,
                  ),
                ),
                if (model.badge != null) ...[
                  const SizedBox(width: 4),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.recentUpdatesBadge,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: CustomText(
                        text: model.badge!,
                        fontSize: 7,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.3,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(height: 10),

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

            const SizedBox(height: 8),

            // Name
            CustomText(
              text: model.name,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              maxLines: 1,
            ),

            // Description (Trash only) — uses Expanded to avoid overflow
            if (model.description != null) ...[
              const SizedBox(height: 4),
              Expanded(
                child: CustomText(
                  text: model.description!,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  height: 1.4,
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
// Analytics row — label + value + progress bar
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
              Flexible(
                child: CustomText(
                  text: model.label,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              CustomText(
                text: model.value,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Progress bar using LayoutBuilder for precise sizing
          LayoutBuilder(
            builder: (_, constraints) {
              return Container(
                height: 6,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: model.barFraction,
                    child: Container(
                      decoration: BoxDecoration(
                        color: model.barColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}