import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ExportPdfButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ExportPdfButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Material(
      color: theme.primaryColor,
      borderRadius: BorderRadius.circular(14.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.picture_as_pdf_outlined,
                size: 18.sp,
                color: Colors.white,
              ),
              SizedBox(width: 8.w),
              Text(
                l10n.exportReportAsPdf,
                style: isDark
                    ? AppStyles.exportPdfButtonTextDark
                    : AppStyles.exportPdfButtonTextLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
