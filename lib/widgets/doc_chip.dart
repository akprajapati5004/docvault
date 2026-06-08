import 'package:flutter/material.dart';

import 'package:docvault/custom_ui/custom_text.dart';
import 'package:docvault/utils/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// DocChip
// ─────────────────────────────────────────────────────────────────────────────
class DocChip extends StatelessWidget {
  const DocChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.prefixIcon,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.chipActiveBg : AppColors.chipInactiveBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppColors.chipActiveBg
                : AppColors.chipInactiveBorder,
            width: 1.2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) ...[
              Icon(
                prefixIcon,
                size: 14,
                color: isSelected
                    ? AppColors.chipActiveText
                    : AppColors.chipInactiveText,
              ),
              const SizedBox(width: 5),
            ],
            CustomText(
              text: label,
              fontSize: 13,
              fontWeight:
              isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected
                  ? AppColors.chipActiveText
                  : AppColors.chipInactiveText,
              letterSpacing: 0.1,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DocChipRow — horizontal scrollable row of DocChips
// ─────────────────────────────────────────────────────────────────────────────
class DocChipRow extends StatelessWidget {
  const DocChipRow({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
    this.icons,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final List<IconData?>? icons;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        children: List.generate(labels.length, (i) {
          return Padding(
            padding: EdgeInsets.only(right: i < labels.length - 1 ? 8 : 0),
            child: DocChip(
              label: labels[i],
              isSelected: i == selectedIndex,
              onTap: () => onSelected(i),
              prefixIcon:
              icons != null && i < icons!.length ? icons![i] : null,
            ),
          );
        }),
      ),
    );
  }
}