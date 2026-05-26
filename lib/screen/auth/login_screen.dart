import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:docvault/custom_ui/auth_widgets.dart';
import 'package:docvault/custom_ui/custom_button.dart';
import 'package:docvault/custom_ui/custom_text_field.dart';
import 'package:docvault/custom_ui/custom_text.dart';
import 'package:docvault/utils/app_colors.dart';
import 'package:docvault/utils/app_strings.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ));

    final controller = Get.find<LoginController>();

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
                const AuthHeader(subtitle: AppStrings.authAppSubtitleLogin),

                const SizedBox(height: 32),

                // ── Main card ───────────────────────────────────────────────
                AuthCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email
                      Obx(() => CustomTextField(
                        label: AppStrings.loginEmailLabel,
                        hint: AppStrings.loginEmailHint,
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

                      // Password field (label rendered in row above)
                      Obx(() => CustomTextField(
                        label: AppStrings.loginPasswordLabel,
                        hint: AppStrings.loginPasswordHint,
                        prefixIcon: Icons.password_rounded,
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.password],
                        controller: controller.passwordCtrl,
                        onChanged: controller.onPasswordChanged,
                        errorText: controller.passwordError.value.isEmpty
                            ? null
                            : controller.passwordError.value,
                        bottomSpacing: 0,
                      )),

                      const SizedBox(height: 20),

                      // Sign In button
                      Obx(() => CustomButton(
                        label: AppStrings.loginButton,
                        onTap: controller.onSignInTapped,
                        suffixIcon: Icons.arrow_forward_rounded,
                        isLoading: controller.isLoading.value,
                        fullWidth: true,
                        height: 56,
                      )),

                      const SizedBox(height: 28),

                      // Divider
                      const AuthDividerRow(label: AppStrings.loginDivider),

                      const SizedBox(height: 28),

                      // Biometric
                      _BiometricSection(onTap: controller.onBiometricTapped),

                      const SizedBox(height: 8),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // Create account link
                AuthInlineLink(
                  prefix: AppStrings.loginNoAccount,
                  linkText: AppStrings.loginCreateAccount,
                  onTap: controller.onCreateAccountTapped,
                ),

                const SizedBox(height: 32),

                // Footer
                const _LoginFooter(),

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
// Biometric section — login-screen only
// ─────────────────────────────────────────────────────────────────────────────
class _BiometricSection extends StatelessWidget {
  const _BiometricSection({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // CustomText(
          //   text: AppStrings.loginBiometricLabel,
          //   fontSize: 15,
          //   fontWeight: FontWeight.w500,
          //   fontFamily: AppFontFamily.inter,
          //   color: AppColors.textPrimary,
          //   textAlign: TextAlign.center,
          // ),
          //
          // const SizedBox(height: 20),
          
          CustomButton(
              label: AppStrings.loginBiometricLabel,
              onTap: (){}
          ),

          // GestureDetector(
          //   onTap: onTap,
          //   child: Container(
          //     width: 76,
          //     height: 76,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: AppColors.surfaceWhite,
          //       border: Border.all(color: AppColors.biometricRing, width: 2.5),
          //       boxShadow: [
          //         BoxShadow(
          //           color: AppColors.primary.withOpacity(0.08),
          //           blurRadius: 16,
          //           offset: const Offset(0, 4),
          //         ),
          //       ],
          //     ),
          //     child: const Icon(
          //       Icons.fingerprint_rounded,
          //       size: 38,
          //       color: AppColors.primary,
          //     ),
          //   ),
          // ),

          const SizedBox(height: 14),

          Text(
            AppStrings.loginBiometricCaption,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textCaption,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Login footer  (AES-256 • Privacy Policy)
// ─────────────────────────────────────────────────────────────────────────────
class _LoginFooter extends StatelessWidget {
  const _LoginFooter();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.shield_outlined, size: 14, color: AppColors.textCaption),
        const SizedBox(width: 4),
        Text(
          AppStrings.loginAes,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.textCaption,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text('•',
              style: GoogleFonts.inter(
                  fontSize: 12, color: AppColors.textCaption)),
        ),
        const Icon(Icons.language_rounded, size: 14, color: AppColors.textCaption),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () {},
          child: Text(
            AppStrings.loginPrivacy,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.textCaption,
            ),
          ),
        ),
      ],
    );
  }
}