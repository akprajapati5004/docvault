import 'package:flutter/material.dart';

import 'package:docvault/custom_ui/custom_text.dart';
import 'package:docvault/utils/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DocTag
// ─────────────────────────────────────────────────────────────────────────────
enum DocTagType { identity, health, legal, action }

class DocTag extends StatelessWidget {
  const DocTag({super.key, required this.type});
  final DocTagType type;

  static _TagStyle _style(DocTagType t) => switch (t) {
    DocTagType.identity => const _TagStyle(
        label: 'IDENTITY',
        bg: AppColors.docTagIdentity,
        text: AppColors.docTagIdentityText),
    DocTagType.health => const _TagStyle(
        label: 'HEALTH',
        bg: AppColors.docTagHealth,
        text: AppColors.docTagHealthText),
    DocTagType.legal => const _TagStyle(
        label: 'LEGAL',
        bg: AppColors.docTagLegal,
        text: AppColors.docTagLegalText),
    DocTagType.action => const _TagStyle(
        label: 'ACTION',
        bg: AppColors.docTagAction,
        text: AppColors.docTagActionText),
  };

  @override
  Widget build(BuildContext context) {
    final s = _style(type);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: s.bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: CustomText(
        text: s.label,
        fontSize: 10,
        fontWeight: FontWeight.w700,
        color: s.text,
        letterSpacing: 0.8,
      ),
    );
  }
}

class _TagStyle {
  const _TagStyle({required this.label, required this.bg, required this.text});
  final String label;
  final Color bg;
  final Color text;
}

// ─────────────────────────────────────────────────────────────────────────────
// DocListTile
// ─────────────────────────────────────────────────────────────────────────────
class DocListTile extends StatelessWidget {
  const DocListTile({
    super.key,
    required this.fileName,
    required this.date,
    required this.size,
    required this.fileIcon,
    required this.fileIconColor,
    required this.fileIconBg,
    this.tagType,
    this.onMoreTap,
    this.onTap,
  });

  final String fileName;
  final String date;
  final String size;
  final IconData fileIcon;
  final Color fileIconColor;
  final Color fileIconBg;
  final DocTagType? tagType;
  final VoidCallback? onMoreTap;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: const BoxDecoration(
          color: AppColors.surfaceWhite,
          border: Border(
            bottom: BorderSide(color: AppColors.divider, width: 0.8),
          ),
        ),
        child: Row(
          children: [
            // File type icon
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: fileIconBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(fileIcon, size: 20, color: fileIconColor),
            ),

            const SizedBox(width: 12),

            // Name + date + size
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: fileName,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Flexible(
                        child: CustomText(
                          text: size.isNotEmpty ? '$date  ·  $size' : date,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textCaption,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Tag + more button
            if (tagType != null) ...[
              const SizedBox(width: 8),
              DocTag(type: tagType!),
            ],
            const SizedBox(width: 4),
            GestureDetector(
              onTap: onMoreTap,
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.more_vert_rounded,
                    size: 20, color: AppColors.textCaption),
              ),
            ),
          ],
        ),
      ),
    );
  }
}