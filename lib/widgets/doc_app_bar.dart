import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:docvault/utils/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// AppBar variant enum
// ─────────────────────────────────────────────────────────────────────────────
enum DocAppBarVariant {
  /// Home — avatar + greeting text left, bell right
  home,
  /// Categories / Settings — logo avatar + title text left, bell right
  logoTitle,
  /// Search — active search field fills the bar
  search,
}

// ─────────────────────────────────────────────────────────────────────────────
// DocAppBar — single reusable AppBar for every screen
// ─────────────────────────────────────────────────────────────────────────────
class DocAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DocAppBar({
    super.key,
    required this.variant,

    // ── Home variant ────────────────────────────────────────────────────────
    this.greeting,
    this.userName,
    this.userAvatarUrl,

    // ── LogoTitle variant ───────────────────────────────────────────────────
    this.title,

    // ── Search variant ───────────────────────────────────────────────────────
    this.searchController,
    this.searchHint,
    this.onSearchChanged,
    this.onSearchClear,

    // ── Shared ──────────────────────────────────────────────────────────────
    this.onNotificationTap,
    this.onAvatarTap,
  });

  final DocAppBarVariant variant;

  final String? greeting;
  final String? userName;
  final String? userAvatarUrl;

  final String? title;

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
    ));

    return Container(
      height: preferredSize.height + MediaQuery.paddingOf(context).top,
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top,
        left: 20,
        right: 20,
      ),
      color: AppColors.surfaceWhite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _buildLeft()),
          const SizedBox(width: 12),
          if (variant != DocAppBarVariant.search)
            _NotificationBell(onTap: onNotificationTap),
        ],
      ),
    );
  }

  Widget _buildLeft() {
    return switch (variant) {
      DocAppBarVariant.home => _HomeLeft(
        greeting: greeting ?? '',
        userName: userName ?? '',
        avatarUrl: userAvatarUrl,
        onAvatarTap: onAvatarTap,
      ),
      DocAppBarVariant.logoTitle => _LogoTitleLeft(
        title: title ?? '',
        onAvatarTap: onAvatarTap,
      ),
      DocAppBarVariant.search => _SearchLeft(
        controller: searchController,
        hint: searchHint ?? 'Search...',
        onChanged: onSearchChanged,
        onClear: onSearchClear,
        onNotificationTap: onNotificationTap,
      ),
    };
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Home left — avatar + greeting + name
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              greeting,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
            Text(
              userName,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// LogoTitle left — small logo + title (Categories / Settings)
// ─────────────────────────────────────────────────────────────────────────────
class _LogoTitleLeft extends StatelessWidget {
  const _LogoTitleLeft({required this.title, this.onAvatarTap});
  final String title;
  final VoidCallback? onAvatarTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onAvatarTap,
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.lock_rounded, color: Colors.white, size: 18),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Search left — full-width search field + bell
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
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(
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