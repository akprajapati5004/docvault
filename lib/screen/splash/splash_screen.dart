import 'package:docvault/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:docvault/custom_ui/custom_text.dart';
import 'package:docvault/utils/app_colors.dart';
import 'package:docvault/utils/app_strings.dart';
import 'package:docvault/screen/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Stack(
            fit: StackFit.expand,
            children: [
              // ── Subtle radial background ─────────────────────────────────
              const _BackgroundLayer(),

              // ── Centred logo + text ──────────────────────────────────────
              Center(
                child: AnimatedBuilder(
                  animation: controller.animationController,
                  builder: (_, __) => FadeTransition(
                    opacity: controller.fadeAnimation,
                    child: ScaleTransition(
                      scale: controller.scaleAnimation,
                      child: const _LogoGroup(),
                    ),
                  ),
                ),
              ),

              // ── Bottom version badge ─────────────────────────────────────
              Positioned(
                bottom: 52,
                left: 0,
                right: 0,
                child: AnimatedBuilder(
                  animation: controller.animationController,
                  builder: (_, __) => FadeTransition(
                    opacity: controller.fadeAnimation,
                    child: const _BottomBadge(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sub-widgets
// ─────────────────────────────────────────────────────────────────────────────

class _BackgroundLayer extends StatelessWidget {
  const _BackgroundLayer();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.0, -0.25),
          radius: 1.1,
          colors: [Color(0xFFFFFFFF), Color(0xFFF6F8FA)],
          stops: [0.0, 1.0],
        ),
      ),
    );
  }
}

class _LogoGroup extends StatelessWidget {
  const _LogoGroup();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo card
        Container(
          width: 112,
          height: 112,
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withValues(alpha: 0.08),
                blurRadius: 40,
                offset: const Offset(0, 12),
              ),
              BoxShadow(
                color: AppColors.shadowColor.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: SvgPicture.asset(
              AppIcons.logo,
              fit: BoxFit.contain,
            ),
          ),
        ),

        const SizedBox(height: 24),

        // App name
        CustomText(
          text: AppStrings.appName,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          fontFamily: AppFontFamily.poppins,
          color: AppColors.textPrimary,
          letterSpacing: -0.8,
          height: 1.0,
        ),

        const SizedBox(height: 6),

        // Tagline
        CustomText(
          text: AppStrings.splashTagline,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: AppFontFamily.inter,
          color: AppColors.textSecondary,
          letterSpacing: 0.1,
        ),
      ],
    );
  }
}

class _BottomBadge extends StatelessWidget {
  const _BottomBadge();

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: AppStrings.appVersion,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: AppFontFamily.inter,
      color: AppColors.textCaption,
      letterSpacing: 0.4,
      textAlign: TextAlign.center,
    );
  }
}