import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:docvault/routes/app_pages.dart';
import 'package:docvault/screen/onboarding/onboarding_illustrations.dart';
import 'package:docvault/screen/onboarding/onboarding_model.dart';
import 'package:docvault/utils/app_strings.dart';

class OnboardingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // ─── Page state ────────────────────────────────────────────────────────────
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  // ─── Button animation ──────────────────────────────────────────────────────
  late final AnimationController buttonAnimController;
  late final Animation<double> buttonScaleAnim;

  // ─── Onboarding pages data ────────────────────────────────────────────────
  late final List<OnboardingPageModel> pages;

  bool get isLastPage => currentPage.value == pages.length - 1;

  // ─── Lifecycle ─────────────────────────────────────────────────────────────

  @override
  void onInit() {
    super.onInit();
    _buildPages();
    _initButtonAnimation();
  }

  @override
  void onClose() {
    pageController.dispose();
    buttonAnimController.dispose();
    super.onClose();
  }

  // ─── Navigation ────────────────────────────────────────────────────────────

  void onPageChanged(int index) {
    currentPage.value = index;
    // Pulse the button on every page turn.
    buttonAnimController.forward(from: 0);
  }

  void onNextTapped() {
    if (isLastPage) {
      _completeOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void onSkipTapped() => _completeOnboarding();

  // ─── Private helpers ───────────────────────────────────────────────────────

  void _buildPages() {
    pages = [
      OnboardingPageModel(
        title: AppStrings.onboarding1Title,
        subtitle: AppStrings.onboarding1Subtitle,
        illustrationBuilder: () => const SecurityIllustration(),
        backgroundGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF0F2FF), Color(0xFFFAFAFF)],
        ),
      ),
      OnboardingPageModel(
        title: AppStrings.onboarding2Title,
        subtitle: AppStrings.onboarding2Subtitle,
        illustrationBuilder: () => const OcrIllustration(),
        backgroundGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF5F6FF), Color(0xFFFFFFFF)],
        ),
      ),
      OnboardingPageModel(
        title: AppStrings.onboarding3Title,
        subtitle: AppStrings.onboarding3Subtitle,
        illustrationBuilder: () => const AccessIllustration(),
        backgroundGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFEEF0FF), Color(0xFFF9FAFF)],
        ),
      ),
    ];
  }

  void _initButtonAnimation() {
    buttonAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    buttonScaleAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.95), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.95, end: 1.0), weight: 1),
    ]).animate(CurvedAnimation(
      parent: buttonAnimController,
      curve: Curves.easeInOut,
    ));
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);
    Get.offNamed(Routes.login);
  }

  static Future<bool> isOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_complete') ?? false;
  }
}