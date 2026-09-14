import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/custom_text_form_filed.dart';

class EditProfileField extends StatefulWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isDropdown;

  const EditProfileField({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.isDropdown = false,
  });

  @override
  State<EditProfileField> createState() => _EditProfileFieldState();
}

class _EditProfileFieldState extends State<EditProfileField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fill = isDark ? AppColorsDark.surface : AppColorsLight.infoBg;
    final text = isDark
        ? AppColorsDark.textPrimary
        : AppColorsLight.textPrimary;
    final muted = isDark
        ? AppColorsDark.textSecondary
        : AppColorsLight.textSecondary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style:
              (isDark
                      ? AppStyles.font12MediumDark
                      : AppStyles.font12MediumLight)
                  .copyWith(color: text, fontSize: 12.sp),
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          controller: _controller,
          filledColor: fill,
          borderColor: isDark ? AppColorsDark.border : Colors.transparent,
          textStyle:
              (isDark
                      ? AppStyles.font14MediumDark
                      : AppStyles.font14MediumLight)
                  .copyWith(color: text, fontSize: 14.sp),
          prefixIcon: Icon(widget.icon, size: 18.sp, color: muted),
          suffixIcon: widget.isDropdown
              ? Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: muted,
                  size: 20.sp,
                )
              : null,
        ),
      ],
    );
  }
}
