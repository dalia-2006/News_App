import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

typedef OnChanged = void Function(String)?;
typedef OnValidator = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  final double? radius;

  final TextStyle? errorStyle;
  final Color? borderColor;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? color;
  final Widget? label;
  final int? maxLines;
  final TextEditingController? controller;
  final OnChanged? onChanged;

  final OnValidator? validator;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomTextField({
    super.key,
    this.obscureText = false,
    this.label,
    this.radius,
    this.suffixIcon,
    this.borderColor,
    this.hintStyle,
    this.hintText,
    this.labelStyle,
    this.labelText,
    this.prefixIcon,
    this.color ,
    this.controller,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
    this.errorStyle,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 16),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: builtDecorationItem(
            radius: radius ?? 16,
            borderColor: borderColor ?? Theme.of(context).dividerColor,
          ),
          focusedBorder: builtDecorationItem(
            radius: radius ?? 16,
            borderColor: borderColor ?? Theme.of(context).cardColor,
          ),
          errorBorder: builtDecorationItem(
            radius: radius ?? 16,
            borderColor: borderColor ?? AppColors.redColor,
          ),
          focusedErrorBorder: builtDecorationItem(
            radius: radius ?? 16,
            borderColor: borderColor ?? Theme.of(context).dividerColor,
          ),
          hintText: hintText,
          hintStyle: hintStyle,
          labelText: labelText,
          labelStyle: labelStyle,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Theme.of(context).dividerColor,
          label: label,
          errorStyle: errorStyle,
        ),
        maxLines: maxLines,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        cursorColor: AppColors.black,

        // obscuringCharacter: '*',
      ),
    );
  }

  OutlineInputBorder builtDecorationItem({
    required double radius,
    required Color borderColor,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: borderColor, width: 2),
    );
  }
}
