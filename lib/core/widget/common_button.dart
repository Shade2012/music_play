import 'package:flutter/material.dart';
import 'package:music_play_bloc/core/theme/textstyle.dart';

class CommonButton extends StatelessWidget {
  CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.style,
    this.borderRadius,
    this.backgroundColor,
    this.fontWeight,
    this.fontSize,
    this.textColor,
    this.padding,
    this.borderColor,
    this.borderWidth,
    this.widget,
    this.isLoading = false,
  });

  final String text;
  final double? width;
  final double? height;
  final double? fontSize;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? widget;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? blackColors,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1.0,
          ),
        ),
        minimumSize: Size(width ?? 0, height ?? 0), // Set minimum size to zero to let the content dictate the size
        padding: padding ?? const EdgeInsets.only(
          left: 16.0,
          top: 8.0,
          right: 16.0,
          bottom: 8.0,
        ), // Use only padding, default values provided
      ),
      child: Center(
        child: isLoading
            ? SizedBox(
          width: 20, // Adjust the width to your preference
          height: 20, // Adjust the height to your preference
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3, // Adjust the stroke width if needed
          ),
        )
            :  widget ??
            Text(
              text,
              style: style ??
                  TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? 16,
                    fontWeight: fontWeight ?? FontWeight.w600,
                  ),
            ),
      ),
    );
  }
}
