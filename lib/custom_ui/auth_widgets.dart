import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:docvault/custom_ui/custom_text.dart';
import 'package:docvault/utils/app_colors.dart';
import 'package:docvault/utils/app_strings.dart';

// ─────────────────────────────────────────────────────────────────────────────
// AuthHeader — logo icon + app name + per-screen subtitle
// ─────────────────────────────────────────────────────────────────────────────
class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.subtitle});
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primaryLight, AppColors.primary],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.30),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(Icons.lock_rounded, color: Colors.white, size: 34),
        ),

        const SizedBox(height: 20),

        CustomText(
          text: AppStrings.appName,
          fontSize: 30,
          fontWeight: FontWeight.w800,
          fontFamily: AppFontFamily.poppins,
          color: AppColors.textPrimary,
          letterSpacing: -0.5,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 6),

        CustomText(
          text: subtitle,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontFamily: AppFontFamily.inter,
          color: AppColors.textSecondary,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// AuthCard — white rounded card with elevation shadow
// ─────────────────────────────────────────────────────────────────────────────
class AuthCard extends StatelessWidget {
  const AuthCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
      decoration: BoxDecoration(
        color: AppColors.authCardBg,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.07),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: AppColors.primary.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// AuthDividerRow — horizontal rule with centred label
// ─────────────────────────────────────────────────────────────────────────────
class AuthDividerRow extends StatelessWidget {
  const AuthDividerRow({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.divider, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textCaption,
              letterSpacing: 0.8,
            ),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.divider, thickness: 1)),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// AuthInlineLink — "Prefix text? Tappable link"
// ─────────────────────────────────────────────────────────────────────────────
class AuthInlineLink extends StatelessWidget {
  const AuthInlineLink({
    super.key,
    required this.prefix,
    required this.linkText,
    required this.onTap,
  });

  final String prefix;
  final String linkText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$prefix ',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            linkText,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textLink,
            ),
          ),
        ),
      ],
    );
  }
}