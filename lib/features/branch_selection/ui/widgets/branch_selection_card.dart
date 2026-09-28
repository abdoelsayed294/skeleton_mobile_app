import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/branch_selection/domain/entity/branches_response.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class BranchSelectionCard extends StatelessWidget {
  final Branch branch;
  final bool isSelected;
  final VoidCallback onTap;

  const BranchSelectionCard({
    super.key,
    required this.branch,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final secondary = isDark
        ? AppColorsDark.textSecondary
        : AppColorsLight.textSecondary;
    final l10n = AppLocalizations.of(context)!;
    final active = branch.isActive == true;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15.r),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: isSelected ? primary : theme.dividerColor,
              width: isSelected ? 1.5 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.08 : 0.035),
                blurRadius: 12.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.business_outlined,
                  color: primary,
                  size: 23.sp,
                ),
              ),
              SizedBox(width: 13.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            branch.storeName ?? l10n.branchFallbackName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: isDark
                                  ? AppColorsDark.textPrimary
                                  : AppColorsLight.textPrimary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        if (active) ...[
                          SizedBox(width: 5.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColorsDark.successBg
                                  : AppColorsLight.successBg,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              l10n.activeBranch,
                              style: TextStyle(
                                color: isDark
                                    ? AppColorsDark.success
                                    : AppColorsLight.success,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Icon(
                isSelected
                    ? Icons.check_circle_rounded
                    : Icons.radio_button_unchecked_rounded,
                color: isSelected ? primary : theme.dividerColor,
                size: 21.sp,
              ),
              Icon(Icons.chevron_right_rounded, color: secondary, size: 24.sp),
            ],
          ),
        ),
      ),
    );
  }
}
