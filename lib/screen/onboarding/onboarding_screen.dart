import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:docvault/custom_ui/custom_button.dart';
import 'package:docvault/custom_ui/custom_text.dart';
import 'package:docvault/utils/app_colors.dart';
import 'package:docvault/utils/app_strings.dart';
import 'package:docvault/screen/onboarding/onboarding_controller.dart';
import 'package:docvault/screen/onboarding/onboarding_model.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ));

    final controller = Get.find<OnboardingController>();
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          // ── Full-screen page view ─────────────────────────────────────────
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            itemCount: controller.pages.length,
            itemBuilder: (_, index) => _OnboardingPage(
              model: controller.pages[index],
              screenHeight: size.height,
            ),
          ),

          // ── Skip button — top right ───────────────────────────────────────
          Positioned(
            top: MediaQuery.paddingOf(context).top + 16,
            right: 24,
            child: Obx(() => AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: controller.isLastPage ? 0.0 : 1.0,
              child: _SkipButton(onTap: controller.onSkipTapped),
            )),
          ),

          // ── Bottom action section ─────────────────────────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _BottomSection(controller: controller),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Individual page
// ─────────────────────────────────────────────────────────────────────────────
class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    required this.model,
    required this.screenHeight,
  });

  final OnboardingPageModel model;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: model.backgroundGradient),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.70,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: model.illustrationBuilder(),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Bottom panel — title, subtitle, dots, button
// ─────────────────────────────────────────────────────────────────────────────
class _BottomSection extends StatelessWidget {
  const _BottomSection({required this.controller});
  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.paddingOf(context).bottom;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.07),
            blurRadius: 32,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(28, 36, 28, bottomPad + 32),
        child: Obx(() {
          final page = controller.currentPage.value;
          final model = controller.pages[page];
          final isLast = controller.isLastPage;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Title ──────────────────────────────────────────────────────
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (child, anim) => FadeTransition(
                  opacity: anim,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.15),
                      end: Offset.zero,
                    ).animate(anim),
                    child: child,
                  ),
                ),
                child: Align(
                  key: ValueKey('title_$page'),
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: model.title,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFontFamily.poppins,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.5,
                    height: 1.2,
                    maxLines: 2,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // ── Subtitle ───────────────────────────────────────────────────
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (child, anim) => FadeTransition(
                  opacity: anim,
                  child: child,
                ),
                child: CustomText(
                  key: ValueKey('sub_$page'),
                  text: model.subtitle,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFontFamily.inter,
                  color: AppColors.textSecondary,
                  height: 1.6,
                  letterSpacing: 0.1,
                  maxLines: 3,
                ),
              ),

              const SizedBox(height: 36),

              // ── Dots + Button row ──────────────────────────────────────────
              Row(
                children: [
                  _PageDots(
                    total: controller.pages.length,
                    current: page,
                  ),

                  const Spacer(),

                  // ── CustomButton ───────────────────────────────────────────
                  AnimatedBuilder(
                    animation: controller.buttonScaleAnim,
                    builder: (_, child) => Transform.scale(
                      scale: controller.buttonScaleAnim.value,
                      child: child,
                    ),
                    child: CustomButton(
                      label: isLast
                          ? AppStrings.onboardingGetStarted
                          : AppStrings.onboardingNext,
                      onTap: controller.onNextTapped,
                      fullWidth: false,
                      height: 52,
                      borderRadius: 16,
                      horizontalPadding: isLast ? 28 : 24,
                      suffixIcon: Icons.arrow_forward_rounded,
                      iconSize: 18,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Page indicator dots
// ─────────────────────────────────────────────────────────────────────────────
class _PageDots extends StatelessWidget {
  const _PageDots({required this.total, required this.current});
  final int total;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (i) {
        final isActive = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
          margin: const EdgeInsets.only(right: 6),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.dotActive : AppColors.dotInactive,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Skip button
// ─────────────────────────────────────────────────────────────────────────────
class _SkipButton extends StatelessWidget {
  const _SkipButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: CustomText(
          text: AppStrings.onboardingSkip,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontFamily: AppFontFamily.inter,
          color: AppColors.textSecondary,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}