import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

/// Centralized theme system for DocVault.
/// All ThemeData is defined here — main.dart references AppTheme.light only.
/// Pattern mirrors the AML reference architecture.
class AppTheme {
  AppTheme._();

  // ── Design sizes for ScreenUtil ──────────────────────────────────────────
  /// Base design canvas for mobile (≤ 450px wide)
  static const Size mobileDesignSize = Size(414, 896);

  /// Base design canvas for tablet (> 450px wide)
  static const Size tabletDesignSize = Size(724, 896);

  /// Returns the correct ScreenUtil design size based on current screen width.
  static Size designSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 ? tabletDesignSize : mobileDesignSize;
  }

  // ── Light theme ──────────────────────────────────────────────────────────
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundColor,

    // Colour scheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary,
      surface: AppColors.surfaceWhite,
    ),

    // AppBar — transparent, no elevation, dark icons
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceWhite,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),

    // Ink effects — disabled for custom press animations
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,

    // Input fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBackground,
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
        const BorderSide(color: AppColors.inputBorder, width: 1.2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
        const BorderSide(color: AppColors.inputBorder, width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
        const BorderSide(color: AppColors.inputBorderFocus, width: 1.8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
        const BorderSide(color: AppColors.inputBorderError, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
        const BorderSide(color: AppColors.inputBorderError, width: 1.8),
      ),
      hintStyle: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.inputHint,
      ),
    ),
  );
}