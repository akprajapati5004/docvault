import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:docvault/custom_ui/custom_text.dart';
import 'package:docvault/utils/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Variant enum
// ─────────────────────────────────────────────────────────────────────────────
enum DocAppBarVariant {
  /// Home — avatar + greeting left, bell right
  home,

  /// Categories / Settings — logo avatar + title left, bell right
  logoTitle,

  /// Search — full-width search field + bell
  search,

  /// Detail screens — back arrow + title + optional action
  detail,
}

// ─────────────────────────────────────────────────────────────────────────────
// DocAppBar — single unified AppBar for every screen in the app
// ─────────────────────────────────────────────────────────────────────────────
class DocAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DocAppBar({
    super.key,
    required this.variant,

    // Home
    this.greeting,
    this.userName,
    this.userAvatarUrl,

    // LogoTitle + Detail
    this.title,

    // Detail
    this.onBackTap,
    this.actionIcon,
    this.onActionTap,

    // Search
    this.searchController,
    this.searchHint,
    this.onSearchChanged,
    this.onSearchClear,

    // Shared
    this.onNotificationTap,
    this.onAvatarTap,
  });

  final DocAppBarVariant variant;

  final String? greeting;
  final String? userName;
  final String? userAvatarUrl;

  final String? title;

  final VoidCallback? onBackTap;
  final IconData? actionIcon;
  final VoidCallback? onActionTap;

  final TextEditingController? searchController;
  final String? searchHint;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onSearchClear;

  final VoidCallback? onNotificationTap;
  final VoidCallback? onAvatarTap;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ));

    return Container(
      height: preferredSize.height + MediaQuery.paddingOf(context).top,
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top,
        left: 20,
        right: 20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _buildLeft(context)),
          const SizedBox(width: 12),
          _buildRight(context),
        ],
      ),
    );
  }

  Widget _buildLeft(BuildContext context) {
    return switch (variant) {
      DocAppBarVariant.home => _HomeLeft(
        greeting: greeting ?? '',
        userName: userName ?? '',
        avatarUrl: userAvatarUrl,
        onAvatarTap: onAvatarTap,
      ),
      DocAppBarVariant.logoTitle => _LogoTitleLeft(title: title ?? ''),
      DocAppBarVariant.search => _SearchLeft(
        controller: searchController,
        hint: searchHint ?? 'Search...',
        onChanged: onSearchChanged,
        onClear: onSearchClear,
        onNotificationTap: onNotificationTap,
      ),
      DocAppBarVariant.detail => _DetailLeft(
        title: title ?? '',
        onBackTap: onBackTap ?? () => Navigator.of(context).maybePop(),
      ),
    };
  }

  Widget _buildRight(BuildContext context) {
    // Search variant handles its own bell internally
    if (variant == DocAppBarVariant.search) return const SizedBox.shrink();

    if (variant == DocAppBarVariant.detail && actionIcon != null) {
      return _IconButton(icon: actionIcon!, onTap: onActionTap);
    }

    return _NotificationBell(onTap: onNotificationTap);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Home left
// ─────────────────────────────────────────────────────────────────────────────
class _HomeLeft extends StatelessWidget {
  const _HomeLeft({
    required this.greeting,
    required this.userName,
    this.avatarUrl,
    this.onAvatarTap,
  });

  final String greeting;
  final String userName;
  final String? avatarUrl;
  final VoidCallback? onAvatarTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onAvatarTap,
          child: _UserAvatar(url: avatarUrl, size: 40),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: greeting,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
                height: 1.4,
                maxLines: 1,
              ),
              CustomText(
                text: userName,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// LogoTitle left
// ─────────────────────────────────────────────────────────────────────────────
class _LogoTitleLeft extends StatelessWidget {
  const _LogoTitleLeft({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.lock_rounded, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomText(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: AppFontFamily.poppins,
            color: AppColors.textPrimary,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Detail left — back button + title
// ─────────────────────────────────────────────────────────────────────────────
class _DetailLeft extends StatelessWidget {
  const _DetailLeft({required this.title, required this.onBackTap});
  final String title;
  final VoidCallback onBackTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBackTap,
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primarySurface,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 16,
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CustomText(
            text: title,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            fontFamily: AppFontFamily.inter,
            color: AppColors.textPrimary,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Search left
// ─────────────────────────────────────────────────────────────────────────────
class _SearchLeft extends StatelessWidget {
  const _SearchLeft({
    this.controller,
    required this.hint,
    this.onChanged,
    this.onClear,
    this.onNotificationTap,
  });

  final TextEditingController? controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final VoidCallback? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.searchBarBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.searchBarBorder),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                const Icon(Icons.search_rounded,
                    size: 20, color: AppColors.inputIcon),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    autofocus: true,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.inputHint,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                if (controller?.text.isNotEmpty ?? false)
                  GestureDetector(
                    onTap: onClear,
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.close_rounded,
                          size: 18, color: AppColors.inputIcon),
                    ),
                  ),
                const SizedBox(width: 4),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        _NotificationBell(onTap: onNotificationTap),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared sub-widgets
// ─────────────────────────────────────────────────────────────────────────────
class _NotificationBell extends StatelessWidget {
  const _NotificationBell({this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.notifications_none_rounded,
        size: 24,
        color: AppColors.textPrimary,
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({required this.icon, this.onTap});
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, size: 24, color: AppColors.textPrimary),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({this.url, required this.size});
  final String? url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primarySurface,
        image: url != null
            ? DecorationImage(image: NetworkImage(url!), fit: BoxFit.cover)
            : null,
      ),
      child: url == null
          ? const Icon(Icons.person_rounded, size: 20, color: AppColors.primary)
          : null,
    );
  }
}