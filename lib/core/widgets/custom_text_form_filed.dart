import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final Color? filledColor;
  final Color borderColor;
  final TextStyle? hintStyle;
  final String? hintText;
  final Widget? label;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isObscureText;
  final bool isPassword;
  final TextStyle? textStyle;
  final bool readonly;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.label,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText = false,
    this.isPassword = false,
    this.filledColor = AppColorsLight.surface,
    this.keyboardType = TextInputType.text,
    this.borderColor = AppColorsLight.border,
    this.readonly = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscureText;

  @override
  void initState() {
    super.initState();
    _isObscureText = widget.isObscureText;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final errorColor = isDark ? AppColorsDark.error : AppColorsLight.error;
    return TextFormField(
      style: widget.textStyle,
      obscureText: _isObscureText,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      readOnly: widget.readonly,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.filledColor,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        label: widget.label,
        labelStyle: widget.labelStyle,
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: BoxConstraints(minWidth: 24.w, minHeight: 24.h),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() => _isObscureText = !_isObscureText);
                },
                icon: Icon(
                  widget.isObscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              )
            : widget.suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: widget.borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: widget.borderColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: errorColor),
        ),
      ),
    );
  }
}
