import 'package:flutter/material.dart';
import 'package:docvault/custom_ui/custom_text.dart';
import 'package:docvault/utils/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Button style variants
// ─────────────────────────────────────────────────────────────────────────────

/// Controls the visual treatment of [CustomButton].
enum ButtonVariant {
  /// Solid gradient fill — primary CTA (Next, Get Started, Sign In…)
  primary,

  /// White/surface background with primary border — secondary action
  outline,

  /// No background, no border — ghost / text-only action
  ghost,
}

// ─────────────────────────────────────────────────────────────────────────────
// CustomButton
// ─────────────────────────────────────────────────────────────────────────────

/// Project-wide button widget.
///
/// Zero [setState] — press feedback is handled via [_PressScaleWrapper] which
/// uses a single [AnimationController] internally (only widget allowed to be
/// StatefulWidget here because it owns a lifecycle-bound animation).
///
/// Usage — primary full-width:
/// ```dart
/// CustomButton(
///   label: AppStrings.onboardingNext,
///   onTap: controller.onNextTapped,
///   suffixIcon: Icons.arrow_forward_rounded,
/// )
/// ```
///
/// Usage — outline compact:
/// ```dart
/// CustomButton(
///   label: AppStrings.commonCancel,
///   variant: ButtonVariant.outline,
///   fullWidth: false,
///   onTap: controller.onCancel,
/// )
/// ```
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,

    // ── Variant ────────────────────────────────────────────────────────────
    this.variant = ButtonVariant.primary,

    // ── Layout ─────────────────────────────────────────────────────────────
    this.fullWidth = true,
    this.height = 56,
    this.borderRadius = 16,
    this.horizontalPadding = 24,

    // ── Icons ──────────────────────────────────────────────────────────────
    this.prefixIcon,
    this.suffixIcon,
    this.iconSize = 18,

    // ── State ──────────────────────────────────────────────────────────────
    this.isLoading = false,
    this.isDisabled = false,

    // ── Typography overrides ───────────────────────────────────────────────
    this.fontSize = 15,
    this.fontWeight = FontWeight.w600,
    this.letterSpacing = 0.2,

    // ── Color overrides (optional — defaults come from variant) ───────────
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.gradientColors,
  });

  final String label;
  final VoidCallback? onTap;

  final ButtonVariant variant;

  final bool fullWidth;
  final double height;
  final double borderRadius;
  final double horizontalPadding;

  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double iconSize;

  final bool isLoading;
  final bool isDisabled;

  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;

  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final List<Color>? gradientColors;

  // ─── Derived helpers ───────────────────────────────────────────────────────

  bool get _isInteractive => !isDisabled && !isLoading && onTap != null;

  Color get _resolvedTextColor {
    if (textColor != null) return textColor!;
    return switch (variant) {
      ButtonVariant.primary => AppColors.textOnPrimary,
      ButtonVariant.outline => AppColors.primary,
      ButtonVariant.ghost   => AppColors.primary,
    };
  }

  Color get _resolvedBorderColor => borderColor ?? AppColors.primary;

  List<Color> get _resolvedGradient =>
      gradientColors ?? [AppColors.primaryLight, AppColors.primary];

  // ─── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final button = _PressScaleWrapper(
      isInteractive: _isInteractive,
      onTap: _isInteractive ? onTap! : null,
      borderRadius: borderRadius,
      child: _ButtonSurface(
        variant: variant,
        height: height,
        borderRadius: borderRadius,
        horizontalPadding: horizontalPadding,
        isDisabled: isDisabled,
        backgroundColor: backgroundColor,
        resolvedGradient: _resolvedGradient,
        resolvedBorderColor: _resolvedBorderColor,
        child: _ButtonContent(
          label: label,
          isLoading: isLoading,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          iconSize: iconSize,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          textColor: _resolvedTextColor,
          isDisabled: isDisabled,
        ),
      ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Press scale feedback wrapper
// (Only StatefulWidget allowed — owns AnimationController lifecycle)
// ─────────────────────────────────────────────────────────────────────────────
class _PressScaleWrapper extends StatefulWidget {
  const _PressScaleWrapper({
    required this.child,
    required this.isInteractive,
    required this.borderRadius,
    this.onTap,
  });

  final Widget child;
  final bool isInteractive;
  final double borderRadius;
  final VoidCallback? onTap;

  @override
  State<_PressScaleWrapper> createState() => _PressScaleWrapperState();
}

class _PressScaleWrapperState extends State<_PressScaleWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      reverseDuration: const Duration(milliseconds: 200),
    );
    _scale = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _onTapDown(_) {
    if (widget.isInteractive) _ctrl.forward();
  }

  void _onTapUp(_) {
    if (widget.isInteractive) _ctrl.reverse();
  }

  void _onTapCancel() {
    if (widget.isInteractive) _ctrl.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _scale,
        builder: (_, child) => Transform.scale(
          scale: _scale.value,
          child: child,
        ),
        child: widget.child,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Surface — handles background, border, shadow per variant
// ─────────────────────────────────────────────────────────────────────────────
class _ButtonSurface extends StatelessWidget {
  const _ButtonSurface({
    required this.variant,
    required this.height,
    required this.borderRadius,
    required this.horizontalPadding,
    required this.isDisabled,
    required this.resolvedGradient,
    required this.resolvedBorderColor,
    required this.child,
    this.backgroundColor,
  });

  final ButtonVariant variant;
  final double height;
  final double borderRadius;
  final double horizontalPadding;
  final bool isDisabled;
  final Color? backgroundColor;
  final List<Color> resolvedGradient;
  final Color resolvedBorderColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    final disabledOpacity = isDisabled ? 0.45 : 1.0;

    return Opacity(
      opacity: disabledOpacity,
      child: switch (variant) {
        ButtonVariant.primary => Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: resolvedGradient,
            ),
            borderRadius: radius,
            boxShadow: isDisabled
                ? null
                : [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.32),
                blurRadius: 18,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: child,
        ),
        ButtonVariant.outline => Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.surfaceWhite,
            borderRadius: radius,
            border: Border.all(color: resolvedBorderColor, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: child,
        ),
        ButtonVariant.ghost => SizedBox(
          height: height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: child,
          ),
        ),
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Content row — icon + label + loader
// ─────────────────────────────────────────────────────────────────────────────
class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.label,
    required this.isLoading,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.iconSize,
    required this.fontSize,
    required this.fontWeight,
    required this.letterSpacing,
    required this.textColor,
    required this.isDisabled,
  });

  final String label;
  final bool isLoading;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double iconSize;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;
  final Color textColor;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.2,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          ),
          const SizedBox(width: 12),
          CustomText(
            text: label,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: AppFontFamily.inter,
            color: textColor,
            letterSpacing: letterSpacing,
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefixIcon != null) ...[
          Icon(prefixIcon, color: textColor, size: iconSize),
          const SizedBox(width: 8),
        ],
        CustomText(
          text: label,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: AppFontFamily.inter,
          color: textColor,
          letterSpacing: letterSpacing,
        ),
        if (suffixIcon != null) ...[
          const SizedBox(width: 8),
          Icon(suffixIcon, color: textColor, size: iconSize),
        ],
      ],
    );
  }
}