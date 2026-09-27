import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/reports/logic/reports_export_cubit.dart';
import 'package:skeleton_mobile_app/features/reports/logic/reports_export_state.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';
import 'package:printing/printing.dart';

class ExportPdfButton extends StatelessWidget {
  final DateTime selectedMonth;

  const ExportPdfButton({super.key, required this.selectedMonth});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<ReportsExportCubit, ReportsExportState>(
      listener: (context, state) async {
        if (state is ReportsExportError) {
          DialogUtils.showMessage(
            context: context,
            type: DialogType.error,
            title: l10n.errorTitle,
            message: state.error.error?.message ?? l10n.genericError,
          );
        } else if (state is ReportsExportSuccess) {
          final fileName =
              'sales_report_${selectedMonth.year}_${selectedMonth.month.toString().padLeft(2, '0')}.pdf';
          try {
            await Printing.sharePdf(bytes: state.pdfBytes, filename: fileName);
          } catch (_) {
            if (!context.mounted) return;
            DialogUtils.showMessage(
              context: context,
              type: DialogType.error,
              title: l10n.errorTitle,
              message: l10n.genericError,
            );
          }
        }
      },
      builder: (context, state) {
        final isLoading = state is ReportsExportLoading;
        return Material(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(14.r),
          child: InkWell(
            onTap: isLoading
                ? null
                : () => context.read<ReportsExportCubit>().exportMonth(
                    selectedMonth,
                    isArabic:
                        Localizations.localeOf(context).languageCode == 'ar',
                  ),
            borderRadius: BorderRadius.circular(14.r),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15.h),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isLoading)
                    SizedBox(
                      width: 18.sp,
                      height: 18.sp,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  else
                    Icon(
                      Icons.picture_as_pdf_outlined,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                  SizedBox(width: 8.w),
                  Text(
                    isLoading ? l10n.loadingMessage : l10n.exportReportAsPdf,
                    style: isDark
                        ? AppStyles.exportPdfButtonTextDark
                        : AppStyles.exportPdfButtonTextLight,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
