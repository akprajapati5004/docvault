import 'dart:math' show cos, sin;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:docvault/custom_ui/auth_widgets.dart';
import 'package:docvault/custom_ui/custom_button.dart';
import 'package:docvault/custom_ui/custom_text_field.dart';
import 'package:docvault/utils/app_colors.dart';
import 'package:docvault/utils/app_strings.dart';
import 'register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ));

    final controller = Get.find<RegisterController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 48),

                // ── Logo + app name ─────────────────────────────────────────
                const AuthHeader(subtitle: AppStrings.authAppSubtitleRegister),

                const SizedBox(height: 32),

                // ── Main card ───────────────────────────────────────────────
                AuthCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Full Name
                      Obx(() => CustomTextField(
                        label: AppStrings.registerNameLabel,
                        hint: AppStrings.registerNameHint,
                        prefixIcon: Icons.person_outline_rounded,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [AutofillHints.name],
                        controller: controller.nameCtrl,
                        onChanged: controller.onNameChanged,
                        errorText: controller.nameError.value.isEmpty
                            ? null
                            : controller.nameError.value,
                      )),

                      // Email
                      Obx(() => CustomTextField(
                        label: AppStrings.registerEmailLabel,
                        hint: AppStrings.registerEmailHint,
                        prefixIcon: Icons.mail_outline_rounded,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [AutofillHints.email],
                        controller: controller.emailCtrl,
                        onChanged: controller.onEmailChanged,
                        errorText: controller.emailError.value.isEmpty
                            ? null
                            : controller.emailError.value,
                      )),

                      // Password
                      Obx(() => CustomTextField(
                        label: AppStrings.registerPasswordLabel,
                        hint: AppStrings.registerPasswordHint,
                        prefixIcon: Icons.password_rounded,
                        isPassword: true,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [AutofillHints.newPassword],
                        controller: controller.passwordCtrl,
                        onChanged: controller.onPasswordChanged,
                        errorText: controller.passwordError.value.isEmpty
                            ? null
                            : controller.passwordError.value,
                      )),

                      // Confirm Password
                      Obx(() => CustomTextField(
                        label: AppStrings.registerConfirmLabel,
                        hint: AppStrings.registerConfirmHint,
                        prefixIcon: Icons.shield_outlined,
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.newPassword],
                        controller: controller.confirmCtrl,
                        onChanged: controller.onConfirmChanged,
                        errorText: controller.confirmError.value.isEmpty
                            ? null
                            : controller.confirmError.value,
                        bottomSpacing: 20,
                      )),

                      // Security note
                      const _SecurityNote(),

                      const SizedBox(height: 20),

                      // Create Account button
                      Obx(() => CustomButton(
                        label: AppStrings.registerButton,
                        onTap: controller.onCreateAccountTapped,
                        suffixIcon: Icons.arrow_forward_rounded,
                        isLoading: controller.isLoading.value,
                        fullWidth: true,
                        height: 56,
                      )),

                      const SizedBox(height: 16),

                      // Sign In link
                      Center(
                        child: AuthInlineLink(
                          prefix: AppStrings.registerHaveAccount,
                          linkText: AppStrings.registerSignIn,
                          onTap: controller.onSignInTapped,
                        ),
                      ),

                      const SizedBox(height: 8),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // GDPR banner
                const _GdprBanner(),

                const SizedBox(height: 24),

                // Terms + copyright
                _RegisterFooter(onTermsTap: controller.onTermsTapped),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Security note badge
// ─────────────────────────────────────────────────────────────────────────────
class _SecurityNote extends StatelessWidget {
  const _SecurityNote();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.securityBadgeBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 1),
            child: Icon(Icons.security_rounded,
                size: 18, color: AppColors.securityBadgeIcon),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              AppStrings.registerSecurityNote,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
                height: 1.55,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// GDPR banner — dark teal card with hex glow
// ─────────────────────────────────────────────────────────────────────────────
class _GdprBanner extends StatelessWidget {
  const _GdprBanner();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0A1628),
                  Color(0xFF0D2137),
                  Color(0xFF0A2E3F),
                ],
              ),
            ),
          ),
          Positioned.fill(child: CustomPaint(painter: _HexGlowPainter())),
          Positioned(
            bottom: 18,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.verified_rounded,
                      color: Colors.white, size: 14),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    AppStrings.registerGdpr,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HexGlowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final glowPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.3, 0.0),
        radius: 0.7,
        colors: [
          const Color(0xFF0ABFBC).withOpacity(0.25),
          const Color(0xFF0ABFBC).withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), glowPaint);

    final hexPaint = Paint()
      ..color = const Color(0xFF0ABFBC).withOpacity(0.13)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    void drawHex(Offset center, double r) {
      final path = Path();
      for (int i = 0; i < 6; i++) {
        final angle = (i * 60 - 30) * 3.14159265 / 180;
        final x = center.dx + r * cos(angle);
        final y = center.dy + r * sin(angle);
        i == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
      }
      path.close();
      canvas.drawPath(path, hexPaint);
    }

    drawHex(Offset(size.width * 0.45, size.height * 0.35), 30);
    drawHex(Offset(size.width * 0.62, size.height * 0.28), 20);
    drawHex(Offset(size.width * 0.28, size.height * 0.45), 15);
    drawHex(Offset(size.width * 0.72, size.height * 0.55), 24);
    drawHex(Offset(size.width * 0.55, size.height * 0.55), 12);
  }

  @override
  bool shouldRepaint(_HexGlowPainter old) => false;
}

// ─────────────────────────────────────────────────────────────────────────────
// Register footer — Terms + copyright
// ─────────────────────────────────────────────────────────────────────────────
class _RegisterFooter extends StatelessWidget {
  const _RegisterFooter({required this.onTermsTap});
  final VoidCallback onTermsTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.inter(
                fontSize: 12, color: AppColors.textSecondary),
            children: [
              TextSpan(text: AppStrings.registerTermsPrefix),
              WidgetSpan(
                child: GestureDetector(
                  onTap: onTermsTap,
                  child: Text(
                    AppStrings.registerTermsLink,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.textLink,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.textLink,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.registerCopyright,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontSize: 12, color: AppColors.textCaption),
        ),
      ],
    );
  }
}