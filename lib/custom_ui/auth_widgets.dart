import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:docvault/custom_ui/custom_text.dart';
import 'package:docvault/utils/app_colors.dart';
import 'package:docvault/utils/app_icons.dart';

// ─────────────────────────────────────────────────────────────────────────────
// AuthHeader
// ─────────────────────────────────────────────────────────────────────────────
class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.subtitle});
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppIcons.appLogo, fit: BoxFit.contain),
        const SizedBox(height: 4),
        CustomText(
          text: subtitle,
          fontSize: 12,
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
// AuthCard
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
// AuthDividerRow
// ─────────────────────────────────────────────────────────────────────────────
class AuthDividerRow extends StatelessWidget {
  const AuthDividerRow({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(color: AppColors.divider, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomText(
            text: label,
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: AppColors.textCaption,
            letterSpacing: 0.8,
          ),
        ),
        const Expanded(
            child: Divider(color: AppColors.divider, thickness: 1)),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// AuthInlineLink
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
        CustomText(
          text: '$prefix ',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        GestureDetector(
          onTap: onTap,
          child: CustomText(
            text: linkText,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textLink,
          ),
        ),
      ],
    );
  }
}