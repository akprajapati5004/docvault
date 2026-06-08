import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A project-wide text widget that enforces consistent typography.
/// All Text() usages across the project should use this instead.
class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.fontFamily = AppFontFamily.inter,
    this.fontStyle = FontStyle.normal,
    this.letterSpacing,
    this.height,
    this.color,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = true,
    this.decoration,
    this.decorationColor,
    this.style,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final AppFontFamily fontFamily;
  final FontStyle fontStyle;
  final double? letterSpacing;
  final double? height;
  final Color? color;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = style ?? _buildStyle();
    return Text(
      text,
      style: resolvedStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? overflow : TextOverflow.clip,
      softWrap: softWrap,
    );
  }

  TextStyle _buildStyle() {
    final base = TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color ?? const Color(0xFF0D0F14),
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
      decorationColor: decorationColor,
    );
    return switch (fontFamily) {
      AppFontFamily.inter    => GoogleFonts.inter(textStyle: base),
      AppFontFamily.poppins  => GoogleFonts.poppins(textStyle: base),
      AppFontFamily.nunito   => GoogleFonts.nunito(textStyle: base),
      AppFontFamily.lato     => GoogleFonts.lato(textStyle: base),
      AppFontFamily.roboto   => GoogleFonts.roboto(textStyle: base),
    };
  }
}

enum AppFontFamily { inter, poppins, nunito, lato, roboto }