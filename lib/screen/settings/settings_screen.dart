import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docvault/custom_ui/custom_button.dart';
import 'package:docvault/utils/app_colors.dart';
import 'package:docvault/utils/app_strings.dart';
import 'package:docvault/widgets/doc_app_bar.dart';
import 'package:docvault/widgets/settings_list_tile.dart';

import 'settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: DocAppBar(
        variant: DocAppBarVariant.logoTitle,
        title: AppStrings.appName,
        onNotificationTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // ── PRO card ──────────────────────────────────────────────────
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _ProCard(),
            ),

            const SizedBox(height: 24),

            // ── Settings list card ────────────────────────────────────────
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.surfaceWhite,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SettingsListTile(
                    icon: Icons.person_outline_rounded,
                    title: AppStrings.settingsProfile,
                    subtitle: AppStrings.settingsProfileSub,
                    onTap: controller.onProfileTap,
                  ),
                  SettingsListTile(
                    icon: Icons.shield_outlined,
                    title: AppStrings.settingsSecurity,
                    subtitle: AppStrings.settingsSecuritySub,
                    onTap: controller.onSecurityTap,
                  ),
                  Obx(() => SettingsListTile(
                    icon: Icons.cloud_sync_outlined,
                    title: AppStrings.settingsCloudSync,
                    subtitle: AppStrings.settingsCloudSyncSub,
                    onTap: controller.onToggleCloudSync,
                    trailingWidget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CloudSyncToggle(
                            isOn: controller.cloudSyncEnabled.value),
                        const SizedBox(width: 6),
                        const Icon(Icons.chevron_right_rounded,
                            size: 20, color: AppColors.textCaption),
                      ],
                    ),
                  )),
                  SettingsListTile(
                    icon: Icons.notifications_none_rounded,
                    title: AppStrings.settingsNotifications,
                    subtitle: AppStrings.settingsNotifSub,
                    onTap: controller.onNotificationsTap,
                  ),
                  SettingsListTile(
                    icon: Icons.help_outline_rounded,
                    title: AppStrings.settingsHelp,
                    subtitle: AppStrings.settingsHelpSub,
                    onTap: controller.onHelpTap,
                  ),
                  SettingsListTile(
                    icon: Icons.info_outline_rounded,
                    title: AppStrings.settingsAbout,
                    subtitle: AppStrings.settingsAboutSub,
                    onTap: controller.onAboutTap,
                    showDivider: false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Sign Out button ───────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                label: AppStrings.settingsSignOut,
                onTap: controller.onSignOut,
                prefixIcon: Icons.logout_rounded,
                fullWidth: true,
                height: 54,
                borderRadius: 14,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                backgroundColor: AppColors.signOutBg,
                textColor: AppColors.signOutText,
                gradientColors: [AppColors.signOutBg, AppColors.signOutBg],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PRO card — navy gradient with PRO label + title + subtitle
// ─────────────────────────────────────────────────────────────────────────────
class _ProCard extends StatelessWidget {
  const _ProCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.proCardGradientStart,
            AppColors.proCardGradientEnd,
          ],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PRO badge
          _ProBadge(),

          SizedBox(height: 12),

          Text(
            AppStrings.settingsProTitle,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 6),

          Text(
            AppStrings.settingsProSubtitle,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xCCFFFFFF), // white at 80% opacity
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProBadge extends StatelessWidget {
  const _ProBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.proCardAccent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text(
        AppStrings.settingsProLabel,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}