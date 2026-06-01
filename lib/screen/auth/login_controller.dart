import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docvault/routes/app_pages.dart';

class LoginController extends GetxController {
  // ─── Text controllers ───────────────────────────────────────────────────────
  final emailCtrl    = TextEditingController();
  final passwordCtrl = TextEditingController();

  // ─── Reactive state ─────────────────────────────────────────────────────────
  final RxString emailError    = ''.obs;
  final RxString passwordError = ''.obs;
  final RxBool   isLoading     = false.obs;

  // ─── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.onClose();
  }

  // ─── Public actions ─────────────────────────────────────────────────────────

  void onEmailChanged(String v) {
    if (emailError.isNotEmpty) emailError.value = '';
  }

  void onPasswordChanged(String v) {
    if (passwordError.isNotEmpty) passwordError.value = '';
  }

  Future<void> onSignInTapped() async {
    if (!_validate()) return;
    isLoading.value = true;
    // TODO: wire to auth repository
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    // On success navigate to dashboard:
    Get.offNamed(Routes.dashboard);
  }

  void onForgotPasswordTapped() {
    // TODO: navigate to forgot password
  }

  void onBiometricTapped() {
    // TODO: trigger local_auth biometric
  }

  void onCreateAccountTapped() {
    Get.toNamed(Routes.register);
  }

  // ─── Private helpers ────────────────────────────────────────────────────────

  bool _validate() {
    bool valid = true;

    final email = emailCtrl.text.trim();
    if (email.isEmpty) {
      emailError.value = 'Email address is required';
      valid = false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Enter a valid email address';
      valid = false;
    } else {
      emailError.value = '';
    }

    final pass = passwordCtrl.text;
    if (pass.isEmpty) {
      passwordError.value = 'Password is required';
      valid = false;
    } else if (pass.length < 8) {
      passwordError.value = 'Password must be at least 8 characters';
      valid = false;
    } else {
      passwordError.value = '';
    }

    return valid;
  }
}