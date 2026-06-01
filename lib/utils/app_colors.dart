import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Backgrounds ────────────────────────────────────────────────────────────
  static const Color backgroundColor    = Color(0xFFF4F5FB);
  static const Color surfaceWhite       = Color(0xFFFFFFFF);
  static const Color surfaceCard        = Color(0xFFF8F9FF);

  // ── Splash gradient ────────────────────────────────────────────────────────
  static const Color splashGradientTop    = Color(0xFFCDD0F0);
  static const Color splashGradientBottom = Color(0xFFE8EAFF);

  // ── Brand / Primary ────────────────────────────────────────────────────────
  static const Color primary        = Color(0xFF1E2A8E);
  static const Color primaryLight   = Color(0xFF3D52C4);
  static const Color primarySurface = Color(0xFFE8EBFF);

  // ── Accent ────────────────────────────────────────────────────────────────
  static const Color accentPink     = Color(0xFFF28B8B);
  static const Color accentLavender = Color(0xFFB8BEF0);
  static const Color accentGreen    = Color(0xFF4CAF7D);
  static const Color accentOrange   = Color(0xFFF97316); // analytics bar
  static const Color accentRed      = Color(0xFFEF4444); // action/error badge

  // ── Text ──────────────────────────────────────────────────────────────────
  static const Color textPrimary    = Color(0xFF0D1240);
  static const Color textSecondary  = Color(0xFF6B7280);
  static const Color textCaption    = Color(0xFF9CA3AF);
  static const Color textOnPrimary  = Color(0xFFFFFFFF);
  static const Color textLink       = Color(0xFF1E2A8E);

  // ── Input fields ──────────────────────────────────────────────────────────
  static const Color inputBackground  = Color(0xFFFFFFFF);
  static const Color inputBorder      = Color(0xFFD1D5DB);
  static const Color inputBorderFocus = Color(0xFF1E2A8E);
  static const Color inputBorderError = Color(0xFFEF4444);
  static const Color inputIcon        = Color(0xFF9CA3AF);
  static const Color inputHint        = Color(0xFFB0B5C8);

  // ── Auth card ─────────────────────────────────────────────────────────────
  static const Color authCardBg     = Color(0xFFFFFFFF);
  static const Color authCardShadow = Color(0x0F1E2A8E);

  // ── Security badge ────────────────────────────────────────────────────────
  static const Color securityBadgeBg   = Color(0xFFEEF0FF);
  static const Color securityBadgeIcon = Color(0xFF6B7ECC);

  // ── Biometric ─────────────────────────────────────────────────────────────
  static const Color biometricRing = Color(0xFFDDE1F8);

  // ── Divider / border ──────────────────────────────────────────────────────
  static const Color border      = Color(0xFFE5E7EB);
  static const Color divider     = Color(0xFFE5E7EB);
  static const Color shadowColor = Color(0x1A1E2A8E);

  // ── Page dots ─────────────────────────────────────────────────────────────
  static const Color dotActive   = Color(0xFF1E2A8E);
  static const Color dotInactive = Color(0xFFD1D5DB);

  // ── Error ─────────────────────────────────────────────────────────────────
  static const Color error        = Color(0xFFEF4444);
  static const Color errorSurface = Color(0xFFFEE2E2);

  // ── Dashboard specific ────────────────────────────────────────────────────
  static const Color navBarActive       = Color(0xFF1E2A8E); // active tab icon+label
  static const Color navBarInactive     = Color(0xFF9CA3AF); // inactive tab
  static const Color navBarBg           = Color(0xFFFFFFFF);
  static const Color navBarBorder       = Color(0xFFE5E7EB);

  static const Color searchBarBg        = Color(0xFFF3F4F6); // search input bg
  static const Color searchBarBorder    = Color(0xFFE5E7EB);

  static const Color chipActiveBg       = Color(0xFF1E2A8E); // selected chip
  static const Color chipActiveText     = Color(0xFFFFFFFF);
  static const Color chipInactiveBg     = Color(0xFFFFFFFF); // unselected chip
  static const Color chipInactiveBorder = Color(0xFFE5E7EB);
  static const Color chipInactiveText   = Color(0xFF6B7280);

  static const Color docTagIdentity     = Color(0xFFEEF0FF);
  static const Color docTagIdentityText = Color(0xFF3D52C4);
  static const Color docTagHealth       = Color(0xFFDCFCE7);
  static const Color docTagHealthText   = Color(0xFF16A34A);
  static const Color docTagLegal        = Color(0xFFFEF9C3);
  static const Color docTagLegalText    = Color(0xFFCA8A04);
  static const Color docTagAction       = Color(0xFFFEE2E2);
  static const Color docTagActionText   = Color(0xFFDC2626);

  static const Color encryptedBadgeBg   = Color(0x99000000);
  static const Color recentUpdatesBadge = Color(0xFFEF4444);

  static const Color analyticsBarBlue   = Color(0xFF1E2A8E);
  static const Color analyticsBarOrange = Color(0xFFF97316);

  static const Color proCardGradientStart = Color(0xFF1E2A8E);
  static const Color proCardGradientEnd   = Color(0xFF3D52C4);
  static const Color proCardAccent        = Color(0xFF6B7ECC);
  static const Color signOutBg            = Color(0xFFFFF1F2);
  static const Color signOutText          = Color(0xFFE11D48);
  static const Color toggleOnBg          = Color(0xFFFF6B35); // cloud sync "On"
}