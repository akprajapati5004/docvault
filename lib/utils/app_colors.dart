import 'package:flutter/material.dart';

/// Design-system colour tokens for DocVault.
/// Every colour used in the app must reference this class — no inline hex values in UI files.
class AppColors {
  AppColors._();

  // ── Backgrounds ────────────────────────────────────────────────────────────
  static const Color backgroundColor    = Color(0xFFF4F5FB); // light lavender-grey
  static const Color surfaceWhite       = Color(0xFFFFFFFF);
  static const Color surfaceCard        = Color(0xFFF8F9FF);

  // ── Splash gradient ────────────────────────────────────────────────────────
  static const Color splashGradientTop    = Color(0xFFCDD0F0);
  static const Color splashGradientBottom = Color(0xFFE8EAFF);

  // ── Brand / Primary ────────────────────────────────────────────────────────
  static const Color primary        = Color(0xFF1E2A8E); // deep navy
  static const Color primaryLight   = Color(0xFF3D52C4); // mid-blue
  static const Color primarySurface = Color(0xFFE8EBFF); // very light tint

  // ── Accent ────────────────────────────────────────────────────────────────
  static const Color accentPink     = Color(0xFFF28B8B);
  static const Color accentLavender = Color(0xFFB8BEF0);
  static const Color accentGreen    = Color(0xFF4CAF7D);

  // ── Text ──────────────────────────────────────────────────────────────────
  static const Color textPrimary    = Color(0xFF0D1240);
  static const Color textSecondary  = Color(0xFF6B7280);
  static const Color textCaption    = Color(0xFF9CA3AF);
  static const Color textOnPrimary  = Color(0xFFFFFFFF);
  static const Color textLink       = Color(0xFF1E2A8E); // same as primary — used for tappable links

  // ── Input fields ──────────────────────────────────────────────────────────
  static const Color inputBackground = Color(0xFFFFFFFF);
  static const Color inputBorder     = Color(0xFFD1D5DB); // default border
  static const Color inputBorderFocus= Color(0xFF1E2A8E); // focused border
  static const Color inputBorderError= Color(0xFFEF4444); // error border
  static const Color inputIcon       = Color(0xFF9CA3AF); // prefix icon tint
  static const Color inputHint       = Color(0xFFB0B5C8); // placeholder text

  // ── Auth card ─────────────────────────────────────────────────────────────
  static const Color authCardBg     = Color(0xFFFFFFFF);
  static const Color authCardShadow = Color(0x0F1E2A8E);

  // ── Security badge ────────────────────────────────────────────────────────
  static const Color securityBadgeBg   = Color(0xFFEEF0FF); // very light blue
  static const Color securityBadgeIcon = Color(0xFF6B7ECC); // muted primary

  // ── Biometric button ──────────────────────────────────────────────────────
  static const Color biometricRing = Color(0xFFDDE1F8);

  // ── Divider / border ──────────────────────────────────────────────────────
  static const Color border      = Color(0xFFE5E7EB);
  static const Color divider     = Color(0xFFE5E7EB);
  static const Color shadowColor = Color(0x1A1E2A8E);

  // ── Page dots ─────────────────────────────────────────────────────────────
  static const Color dotActive   = Color(0xFF1E2A8E);
  static const Color dotInactive = Color(0xFFD1D5DB);

  // ── Error ─────────────────────────────────────────────────────────────────
  static const Color error       = Color(0xFFEF4444);
  static const Color errorSurface= Color(0xFFFEE2E2);
}