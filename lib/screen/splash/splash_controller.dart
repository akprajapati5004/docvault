import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import 'package:docvault/routes/app_pages.dart';
import 'package:docvault/screen/onboarding/onboarding_controller.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // ─── Animation ─────────────────────────────────────────────────────────────
  late final AnimationController animationController;
  late final Animation<double> fadeAnimation;
  late final Animation<double> scaleAnimation;

  // ─── Lifecycle ─────────────────────────────────────────────────────────────

  @override
  void onInit() {
    super.onInit();
    _initAnimations();
    _startSequence();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  // ─── Private ───────────────────────────────────────────────────────────────

  void _initAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );

    scaleAnimation = Tween<double>(begin: 0.82, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutCubic,
      ),
    );
  }

  Future<void> _startSequence() async {
    await Future.delayed(const Duration(milliseconds: 120));
    animationController.forward();
    await Future.delayed(const Duration(milliseconds: 2000));
    await _navigate();
  }

  Future<void> _navigate() async {
    final onboardingDone = await OnboardingController.isOnboardingComplete();

    if (onboardingDone) {
      // Returning user — go straight to login
      Get.offNamed(Routes.login);
    } else {
      // First launch — show onboarding
      Get.offNamed(Routes.onboarding);
    }
  }
}