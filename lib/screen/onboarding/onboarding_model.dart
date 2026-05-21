import 'package:flutter/material.dart';

/// Data model for a single onboarding page.
/// Keeps all page content in one place — easy to add/remove pages.
class OnboardingPageModel {
  const OnboardingPageModel({
    required this.title,
    required this.subtitle,
    required this.illustrationBuilder,
    required this.backgroundGradient,
  });

  final String title;
  final String subtitle;

  /// Widget builder for the hero illustration section.
  /// Using a builder keeps the model decoupled from concrete widget instances.
  final Widget Function() illustrationBuilder;

  /// Each page can carry its own subtle background tint.
  final LinearGradient backgroundGradient;
}