import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:docvault/custom_ui/auth_widgets.dart';
import 'package:docvault/custom_ui/custom_button.dart';
import 'package:docvault/custom_ui/custom_text.dart';
import 'package:docvault/custom_ui/custom_text_field.dart';
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
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    // Constrain card width on tablets
    final contentWidth = screenWidth > 600 ? 480.0 : double.infinity;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: screenHeight * 0.04,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: contentWidth),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo + subtitle
                    const AuthHeader(subtitle: AppStrings.authAppSubtitleLogin),
                    const SizedBox(height: 32),

                    // Main card
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

                          // Password
                          Obx(() => CustomTextField(
                            label: AppStrings.loginPasswordLabel,
                            hint: AppStrings.loginPasswordHint,
                            prefixIcon: Icons.password_rounded,
                            isPassword: true,
                            textInputAction: TextInputAction.done,
                            autofillHints: const [AutofillHints.password],
                            controller: controller.passwordCtrl,
                            onChanged: controller.onPasswordChanged,
                            errorText:
                            controller.passwordError.value.isEmpty
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

                          const AuthDividerRow(label: AppStrings.loginDivider),

                          const SizedBox(height: 28),

                          _BiometricSection(
                              onTap: controller.onBiometricTapped),

                          const SizedBox(height: 8),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    AuthInlineLink(
                      prefix: AppStrings.loginNoAccount,
                      linkText: AppStrings.loginCreateAccount,
                      onTap: controller.onCreateAccountTapped,
                    ),

                    const SizedBox(height: 24),

                    const _LoginFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Biometric section
// ─────────────────────────────────────────────────────────────────────────────
class _BiometricSection extends StatelessWidget {
  const _BiometricSection({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomButton(label: AppStrings.loginBiometricLabel, onTap: onTap),
          const SizedBox(height: 14),
          const CustomText(
            text: AppStrings.loginBiometricCaption,
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: AppColors.textCaption,
            letterSpacing: 0.8,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Login footer
// ─────────────────────────────────────────────────────────────────────────────
class _LoginFooter extends StatelessWidget {
  const _LoginFooter();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 4,
      children: [
        const Icon(Icons.shield_outlined,
            size: 14, color: AppColors.textCaption),
        const CustomText(
          text: AppStrings.loginAes,
          fontSize: 12,
          color: AppColors.textCaption,
        ),
        const CustomText(text: '•', fontSize: 12, color: AppColors.textCaption),
        const Icon(Icons.language_rounded,
            size: 14, color: AppColors.textCaption),
        GestureDetector(
          onTap: () {},
          child: const CustomText(
            text: AppStrings.loginPrivacy,
            fontSize: 12,
            color: AppColors.textCaption,
          ),
        ),
      ],
    );
  }
}