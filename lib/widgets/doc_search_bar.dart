import 'package:flutter/material.dart';

import 'package:docvault/utils/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DocSearchBar — inline search bar used on Home + Categories screens
// ─────────────────────────────────────────────────────────────────────────────
class DocSearchBar extends StatelessWidget {
  const DocSearchBar({
    super.key,
    required this.hint,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onFilterTap,
    this.readOnly = false,
  });

  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onFilterTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: AppColors.searchBarBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.searchBarBorder),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Icon(Icons.search_rounded, size: 20, color: AppColors.inputIcon),
          const SizedBox(width: 8),
          Expanded(
            child: readOnly
                ? GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Text(
                hint,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.inputHint,
                ),
              ),
            )
                : TextField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.inputHint,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          GestureDetector(
            onTap: onFilterTap,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.tune_rounded, size: 20, color: AppColors.inputIcon),
            ),
          ),
        ],
      ),
    );
  }
}