import 'package:flutter/material.dart';

import 'package:docvault/custom_ui/custom_text.dart';
import 'package:docvault/utils/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SettingsListTile
// ─────────────────────────────────────────────────────────────────────────────
class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.trailingWidget,
    this.showDivider = true,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? trailingWidget;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                // Icon bubble
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primarySurface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, size: 20, color: AppColors.primary),
                ),

                const SizedBox(width: 14),

                // Title + subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: title,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 2),
                      CustomText(
                        text: subtitle,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                        height: 1.4,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),

                // Trailing
                trailingWidget ??
                    const Icon(Icons.chevron_right_rounded,
                        size: 20, color: AppColors.textCaption),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 0.8,
            color: AppColors.divider,
            indent: 74,
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CloudSyncToggle
// ─────────────────────────────────────────────────────────────────────────────
class CloudSyncToggle extends StatelessWidget {
  const CloudSyncToggle({super.key, required this.isOn});
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isOn ? AppColors.toggleOnBg : AppColors.textCaption,
        borderRadius: BorderRadius.circular(12),
      ),
      child: CustomText(
        text: isOn ? 'On' : 'Off',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}