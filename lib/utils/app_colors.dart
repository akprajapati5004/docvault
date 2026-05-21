import 'package:flutter/material.dart';

/// Design-system colour tokens for DocVault.
/// Every colour used in the app must reference this class — no inline hex values in UI files.
class AppColors {
  AppColors._();

  // ── Backgrounds ────────────────────────────────────────────────────────────
  static const Color backgroundColor   = Color(0xFFF4F5FB); // light lavender-grey
  static const Color surfaceWhite       = Color(0xFFFFFFFF);
  static const Color surfaceCard        = Color(0xFFF8F9FF);

  // ── Splash gradient ────────────────────────────────────────────────────────
  static const Color splashGradientTop    = Color(0xFFCDD0F0); // periwinkle
  static const Color splashGradientBottom = Color(0xFFE8EAFF);

  // ── Brand / Primary ────────────────────────────────────────────────────────
  static const Color primary        = Color(0xFF1E2A8E); // deep navy-blue (button, active dot)
  static const Color primaryLight   = Color(0xFF3D52C4); // mid-blue
  static const Color primarySurface = Color(0xFFE8EBFF); // very light blue tint

  // ── Accent ────────────────────────────────────────────────────────────────
  static const Color accentPink     = Color(0xFFF28B8B); // soft coral/pink shield
  static const Color accentLavender = Color(0xFFB8BEF0); // light lavender ring
  static const Color accentGreen    = Color(0xFF4CAF7D); // OCR success tick

  // ── Text ──────────────────────────────────────────────────────────────────
  static const Color textPrimary    = Color(0xFF0D1240); // almost-black navy
  static const Color textSecondary  = Color(0xFF6B7280); // muted grey
  static const Color textCaption    = Color(0xFF9CA3AF); // lighter caption
  static const Color textOnPrimary  = Color(0xFFFFFFFF); // white on dark buttons

  // ── Page dots ─────────────────────────────────────────────────────────────
  static const Color dotActive   = Color(0xFF1E2A8E);
  static const Color dotInactive = Color(0xFFD1D5DB);

  // ── Divider / border ──────────────────────────────────────────────────────
  static const Color border      = Color(0xFFE5E7EB);
  static const Color shadowColor = Color(0x1A1E2A8E); // 10% primary
}