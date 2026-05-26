import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:docvault/utils/app_colors.dart';

// ─────────────────────────────────────────────────────────────────────────────
// CustomTextField
// ─────────────────────────────────────────────────────────────────────────────

/// Project-wide text input widget.
///
/// Supports email, password (with show/hide toggle), plain text, and
/// multiline modes. Error state is driven reactively via [errorText].
///
/// Usage — email:
/// ```dart
/// CustomTextField(
///   label: AppStrings.loginEmailLabel,
///   hint: AppStrings.loginEmailHint,
///   prefixIcon: Icons.mail_outline_rounded,
///   keyboardType: TextInputType.emailAddress,
///   controller: controller.emailCtrl,
///   errorText: controller.emailError,
/// )
/// ```
///
/// Usage — password with toggle:
/// ```dart
/// CustomTextField(
///   label: AppStrings.loginPasswordLabel,
///   hint: AppStrings.loginPasswordHint,
///   prefixIcon: Icons.password_rounded,
///   isPassword: true,
///   controller: controller.passwordCtrl,
///   errorText: controller.passwordError,
/// )
/// ```
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,

    // ── Controller & value ─────────────────────────────────────────────────
    this.controller,
    this.onChanged,
    this.onSubmitted,

    // ── Appearance ─────────────────────────────────────────────────────────
    this.prefixIcon,
    this.labelStyle,

    // ── Behaviour ──────────────────────────────────────────────────────────
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.autofillHints,
    this.focusNode,
    this.autofocus = false,
    this.readOnly = false,

    // ── Validation ─────────────────────────────────────────────────────────
    /// Reactive string — when non-null/non-empty the field enters error state.
    this.errorText,

    // ── Layout ─────────────────────────────────────────────────────────────
    this.bottomSpacing = 20,
  });

  final String label;
  final String hint;

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  final IconData? prefixIcon;
  final TextStyle? labelStyle;

  final bool isPassword;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool readOnly;

  /// Pass an `Rx<String?>` via `.value`, or plain `String?`.
  final String? errorText;

  final double bottomSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Label row ────────────────────────────────────────────────────────
        _FieldLabel(label: label, customStyle: labelStyle),
        const SizedBox(height: 8),

        // ── Input ────────────────────────────────────────────────────────────
        isPassword
            ? _PasswordField(
          hint: hint,
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          prefixIcon: prefixIcon ?? Icons.password_rounded,
          textInputAction: textInputAction,
          autofillHints: autofillHints,
          focusNode: focusNode,
          autofocus: autofocus,
          readOnly: readOnly,
          errorText: errorText,
        )
            : _PlainField(
          hint: hint,
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          prefixIcon: prefixIcon,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          autofillHints: autofillHints,
          focusNode: focusNode,
          autofocus: autofocus,
          readOnly: readOnly,
          errorText: errorText,
        ),

        // ── Error message ────────────────────────────────────────────────────
        if (errorText != null && errorText!.isNotEmpty) ...[
          const SizedBox(height: 6),
          _ErrorText(text: errorText!),
        ],

        SizedBox(height: bottomSpacing),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Plain text field (email, name, etc.)
// ─────────────────────────────────────────────────────────────────────────────
class _PlainField extends StatelessWidget {
  const _PlainField({
    required this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.autofillHints,
    this.focusNode,
    this.autofocus = false,
    this.readOnly = false,
    this.errorText,
  });

  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool readOnly;
  final String? errorText;

  bool get _hasError => errorText != null && errorText!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      autofillHints: autofillHints,
      focusNode: focusNode,
      autofocus: autofocus,
      readOnly: readOnly,
      style: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      decoration: _inputDecoration(
        hint: hint,
        prefixIcon: prefixIcon,
        hasError: _hasError,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Password field — with reactive show/hide toggle (GetX, no setState)
// ─────────────────────────────────────────────────────────────────────────────
class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.hint,
    required this.prefixIcon,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction = TextInputAction.done,
    this.autofillHints,
    this.focusNode,
    this.autofocus = false,
    this.readOnly = false,
    this.errorText,
  });

  final String hint;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction textInputAction;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool readOnly;
  final String? errorText;

  bool get _hasError => errorText != null && errorText!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    // Each password field owns its own visibility toggle via GetX.
    // Using a tag based on hint to avoid collision when multiple password
    // fields appear on the same screen (password + confirm).
    final tag = 'pwd_visible_${hint.hashCode}';
    final isVisible = false.obs;
    // Put only if not already registered (safe for hot-reload).
    if (!Get.isRegistered<RxBool>(tag: tag)) {
      Get.put<RxBool>(isVisible, tag: tag);
    }
    final visibility = Get.find<RxBool>(tag: tag);

    return Obx(() => TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      focusNode: focusNode,
      autofocus: autofocus,
      readOnly: readOnly,
      obscureText: !visibility.value,
      style: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      decoration: _inputDecoration(
        hint: hint,
        prefixIcon: prefixIcon,
        hasError: _hasError,
        suffixWidget: GestureDetector(
          onTap: () => visibility.value = !visibility.value,
          child: Icon(
            visibility.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: 20,
            color: AppColors.inputIcon,
          ),
        ),
      ),
    ));
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Shared decoration factory
// ─────────────────────────────────────────────────────────────────────────────
InputDecoration _inputDecoration({
  required String hint,
  IconData? prefixIcon,
  bool hasError = false,
  Widget? suffixWidget,
}) {
  final borderColor = hasError ? AppColors.inputBorderError : AppColors.inputBorder;
  final focusBorderColor = hasError ? AppColors.inputBorderError : AppColors.inputBorderFocus;

  return InputDecoration(
    hintText: hint,
    hintStyle: GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColors.inputHint,
    ),
    filled: true,
    fillColor: AppColors.inputBackground,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    prefixIcon: prefixIcon != null
        ? Padding(
      padding: const EdgeInsets.only(left: 14, right: 10),
      child: Icon(prefixIcon, size: 20, color: AppColors.inputIcon),
    )
        : null,
    prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    suffixIcon: suffixWidget != null
        ? Padding(
      padding: const EdgeInsets.only(right: 14),
      child: suffixWidget,
    )
        : null,
    suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: borderColor, width: 1.2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: borderColor, width: 1.2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: focusBorderColor, width: 1.8),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.inputBorderError, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.inputBorderError, width: 1.8),
    ),
    isDense: false,
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// Sub-widgets
// ─────────────────────────────────────────────────────────────────────────────

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.label, this.customStyle});
  final String label;
  final TextStyle? customStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: customStyle ??
          GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
    );
  }
}

class _ErrorText extends StatelessWidget {
  const _ErrorText({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.error_outline_rounded,
            size: 13, color: AppColors.error),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.error,
            ),
          ),
        ),
      ],
    );
  }
}