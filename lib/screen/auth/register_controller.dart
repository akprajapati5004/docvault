import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docvault/routes/app_pages.dart';

class RegisterController extends GetxController {
  // ─── Text controllers ───────────────────────────────────────────────────────
  final nameCtrl     = TextEditingController();
  final emailCtrl    = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmCtrl  = TextEditingController();

  // ─── Reactive state ─────────────────────────────────────────────────────────
  final RxString nameError     = ''.obs;
  final RxString emailError    = ''.obs;
  final RxString passwordError = ''.obs;
  final RxString confirmError  = ''.obs;
  final RxBool   isLoading     = false.obs;

  // ─── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    confirmCtrl.dispose();
    super.onClose();
  }

  // ─── Public actions ─────────────────────────────────────────────────────────

  void onNameChanged(String v)     { if (nameError.isNotEmpty)     nameError.value = ''; }
  void onEmailChanged(String v)    { if (emailError.isNotEmpty)    emailError.value = ''; }
  void onPasswordChanged(String v) { if (passwordError.isNotEmpty) passwordError.value = ''; }
  void onConfirmChanged(String v)  { if (confirmError.isNotEmpty)  confirmError.value = ''; }

  Future<void> onCreateAccountTapped() async {
    if (!_validate()) return;
    isLoading.value = true;
    // TODO: wire to auth repository
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    // On success:
    // Get.offAllNamed(Routes.dashboard);
  }

  void onSignInTapped() => Get.back();

  void onTermsTapped() {
    // TODO: open terms of service
  }

  // ─── Private helpers ────────────────────────────────────────────────────────

  bool _validate() {
    bool valid = true;

    if (nameCtrl.text.trim().isEmpty) {
      nameError.value = 'Full name is required';
      valid = false;
    } else {
      nameError.value = '';
    }

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

    final confirm = confirmCtrl.text;
    if (confirm.isEmpty) {
      confirmError.value = 'Please confirm your password';
      valid = false;
    } else if (confirm != pass) {
      confirmError.value = 'Passwords do not match';
      valid = false;
    } else {
      confirmError.value = '';
    }

    return valid;
  }
}