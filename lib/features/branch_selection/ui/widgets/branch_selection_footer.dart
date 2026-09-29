import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/theming/app_color.dart';
import 'package:skeleton/core/theming/app_style.dart';
import 'package:skeleton/features/branch_selection/domain/entity/branches_response.dart';
import 'package:skeleton/l10n/app_localizations.dart';

class BranchSelectionFooter extends StatelessWidget {
  final Branch? selectedBranch;
  final VoidCallback onContinue;
  final bool isLoading;

  const BranchSelectionFooter({
    super.key,
    required this.selectedBranch,
    required this.onContinue,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 54.h,
          child: FilledButton.icon(
            onPressed: selectedBranch?.id == null || isLoading
                ? null
                : onContinue,
            icon: isLoading
                ? SizedBox(
                    width: 16.w,
                    height: 16.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.arrow_forward_rounded),
            label: Text(
              isLoading ? l10n.loadingMessage : l10n.continueToDashboard,
            ),
            style: FilledButton.styleFrom(
              backgroundColor: primary,
              foregroundColor: Colors.white,
              disabledBackgroundColor: primary.withValues(alpha: 0.45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 4,
              shadowColor: primary.withValues(alpha: 0.28),
              textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: primary.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.selectedBranch,
                style:
                    (isDark
                            ? AppStyles.font12MediumDark
                            : AppStyles.font12MediumLight)
                        .copyWith(fontSize: 11.sp),
              ),
              SizedBox(height: 3.h),
              Text(
                selectedBranch?.storeName ?? l10n.noneSelected,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    (isDark
                            ? AppStyles.font16BoldDark
                            : AppStyles.font16BoldLight)
                        .copyWith(fontSize: 15.sp, color: primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
