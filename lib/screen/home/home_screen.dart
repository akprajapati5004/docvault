import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docvault/utils/app_colors.dart';
import 'package:docvault/utils/app_strings.dart';
import 'package:docvault/widgets/doc_app_bar.dart';
import 'package:docvault/widgets/doc_chip.dart';
import 'package:docvault/widgets/doc_list_tile.dart';
import 'package:docvault/widgets/doc_search_bar.dart';

import '../dashboard/dashboard_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: DocAppBar(
        variant: DocAppBarVariant.home,
        greeting: controller.greeting,
        userName: controller.userName,
        onNotificationTap: () {},
        onAvatarTap: () {},
      ),
      body: CustomScrollView(
        slivers: [
          // ── Search bar ──────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: DocSearchBar(
                hint: AppStrings.homeSearchHint,
                readOnly: true,
                onTap: () => controller.onTabChanged(2),
                onFilterTap: () {},
              ),
            ),
          ),

          // ── Recent Documents header ──────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    AppStrings.homeRecentDocs,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      AppStrings.homeViewAll,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textLink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Recent docs horizontal scroll ────────────────────────────────
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: controller.recentDocuments.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, i) {
                  final doc = controller.recentDocuments[i];
                  return _RecentDocCard(
                    fileName: doc.fileName,
                    subtitle: '${doc.date}  •  ${doc.size}',
                    isEncrypted: doc.isEncrypted,
                    onTap: () {},
                  );
                },
              ),
            ),
          ),

          // ── Filter chips ────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 12),
              child: Obx(() => DocChipRow(
                labels: controller.filterLabels,
                selectedIndex: controller.selectedFilter.value,
                onSelected: controller.onFilterChanged,
                padding: const EdgeInsets.symmetric(horizontal: 20),
              )),
            ),
          ),

          // ── All Documents header + list — reactive to filter ─────────────
          SliverToBoxAdapter(
            child: Obx(() {
              final docs = controller.filteredDocuments;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          AppStrings.homeAllDocs,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          '${docs.length} items',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textCaption,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Document list
                  if (docs.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Center(
                        child: Text(
                          'No documents in this category',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: AppColors.textCaption,
                          ),
                        ),
                      ),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: docs.length,
                      itemBuilder: (_, i) {
                        final doc = docs[i];
                        return DocListTile(
                          fileName: doc.fileName,
                          date: doc.date,
                          size: doc.size,
                          fileIcon: doc.fileIcon,
                          fileIconColor: doc.fileIconColor,
                          fileIconBg: doc.fileIconBg,
                          tagType: doc.tagType,
                          onMoreTap: () {},
                          onTap: () {},
                        );
                      },
                    ),

                  const SizedBox(height: 24),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Recent doc card — thumbnail + encrypted badge + filename + meta
// ─────────────────────────────────────────────────────────────────────────────
class _RecentDocCard extends StatelessWidget {
  const _RecentDocCard({
    required this.fileName,
    required this.subtitle,
    required this.isEncrypted,
    required this.onTap,
  });

  final String fileName;
  final String subtitle;
  final bool isEncrypted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(color: const Color(0xFFE5E7EB)),
                    const Icon(Icons.image_outlined,
                        size: 40, color: Color(0xFFD1D5DB)),

                    // Encrypted badge
                    if (isEncrypted)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.encryptedBadgeBg,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.shield_rounded,
                                  size: 10, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                AppStrings.homeEncrypted,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Filename
            Text(
              fileName,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 2),

            // Date + size
            Text(
              subtitle,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
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
    );
  }
}