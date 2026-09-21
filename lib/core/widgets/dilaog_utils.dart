import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

enum DialogType { success, error, warning, info }

class _DialogTypeStyle {
  final Color color;
  final Color softColor;
  final IconData icon;
  const _DialogTypeStyle(this.color, this.softColor, this.icon);
}

class DialogUtils {
  /// Tracks whether the loading dialog is currently on screen, so we never
  /// pop a route that isn't actually the loading dialog (and never stack
  /// more than one loading dialog on top of another).
  static bool _isLoadingVisible = false;

  /// Tracks whether a message (error/success/etc) dialog is currently on
  /// screen, so we never stack two of them on top of each other.
  static bool _isMessageVisible = false;

  static _DialogTypeStyle _styleFor(BuildContext context, DialogType type) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    switch (type) {
      case DialogType.success:
        return _DialogTypeStyle(
          isDark ? AppColorsDark.success : AppColorsLight.success,
          isDark ? AppColorsDark.successBg : AppColorsLight.successBg,
          Icons.check_circle_rounded,
        );
      case DialogType.error:
        return _DialogTypeStyle(
          isDark ? AppColorsDark.error : AppColorsLight.error,
          isDark ? AppColorsDark.errorBg : AppColorsLight.errorBg,
          Icons.error_rounded,
        );
      case DialogType.warning:
        return _DialogTypeStyle(
          isDark ? AppColorsDark.warning : AppColorsLight.warning,
          (isDark ? AppColorsDark.warning : AppColorsLight.warning).withValues(
            alpha: 0.14,
          ),
          Icons.warning_rounded,
        );
      case DialogType.info:
        return _DialogTypeStyle(
          isDark ? AppColorsDark.primary : AppColorsLight.primary,
          isDark
              ? AppColorsDark.primary.withValues(alpha: 0.14)
              : AppColorsLight.infoBg,
          Icons.info_rounded,
        );
    }
  }

  /// Shows a centered, rounded loading dialog with the app's primary color.
  static void showLoading({required BuildContext context, String? message}) {
    if (_isLoadingVisible) return;
    _isLoadingVisible = true;
    showDialog(
      barrierDismissible: false,
      useRootNavigator: true,
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        final isDark = theme.brightness == Brightness.dark;
        final l10n = AppLocalizations.of(context)!;
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 28.h,
                  width: 28.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isDark ? AppColorsDark.primary : AppColorsLight.primary,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Flexible(
                  child: Text(
                    message ?? l10n.loadingMessage,
                    style: isDark
                        ? AppStyles.txnIdDark.copyWith(fontSize: 14.sp)
                        : AppStyles.txnIdLight.copyWith(fontSize: 14.sp),
                    textAlign: Directionality.of(context) == TextDirection.rtl
                        ? TextAlign.right
                        : TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) => _isLoadingVisible = false);
  }

  static void hideLoading(BuildContext context) {
    if (!_isLoadingVisible) return;
    _isLoadingVisible = false;
    Navigator.of(context, rootNavigator: true).pop();
  }

  /// Shows a rounded feedback dialog with a colored icon that matches [type].
  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    DialogType type = DialogType.error,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    if (_isMessageVisible) return;
    _isMessageVisible = true;

    showDialog(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        final isDark = theme.brightness == Brightness.dark;
        final style = _styleFor(context, type);
        final l10n = AppLocalizations.of(context)!;
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(24.w, 28.h, 24.w, 20.h),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 64.h,
                  width: 64.w,
                  decoration: BoxDecoration(
                    color: style.softColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(style.icon, color: style.color, size: 34.sp),
                ),
                SizedBox(height: 16.h),
                if (title != null && title.isNotEmpty) ...[
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: isDark
                        ? AppStyles.reportsHeaderTitleDark
                        : AppStyles.reportsHeaderTitleLight,
                  ),
                  SizedBox(height: 8.h),
                ],
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: isDark ? AppStyles.txnIdDark : AppStyles.txnIdLight,
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    if (negActionName != null)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            negAction?.call();
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            side: BorderSide(
                              color: isDark
                                  ? AppColorsDark.primary
                                  : AppColorsLight.primary,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            negActionName,
                            style: isDark
                                ? AppStyles.txnIdDark
                                : AppStyles.txnIdLight,
                          ),
                        ),
                      ),
                    if (negActionName != null && posActionName != null)
                      SizedBox(width: 12.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          posAction?.call();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: style.color,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          posActionName ?? l10n.ok,
                          style: isDark
                              ? AppStyles.totalSalesChangeDark
                              : AppStyles.totalSalesChangeLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) => _isMessageVisible = false);
  }
}
