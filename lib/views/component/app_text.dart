import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppText(
    this.text, {
    super.key,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  factory AppText.bold(
    String text, {
    double fontSize = 14,
    Color? color,
    TextAlign? align,
  }) {
    return AppText(
      text,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      align: align,
    );
  }

  factory AppText.normal(
    String text, {
    double fontSize = 14,
    Color? color,
    TextAlign? align,
  }) {
    return AppText(
      text,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
      align: align,
    );
  }
}
