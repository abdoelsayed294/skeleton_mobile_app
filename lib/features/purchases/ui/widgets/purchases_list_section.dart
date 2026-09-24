import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_recent_cubit.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_recent_state.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchase_record_card.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_count_badge.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_list_shimmer.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class PurchasesListSection extends StatefulWidget {
  final ScrollController scrollController;

  const PurchasesListSection({super.key, required this.scrollController});

  @override
  State<PurchasesListSection> createState() => _PurchasesListSectionState();
}

class _PurchasesListSectionState extends State<PurchasesListSection> {
  int _lastItemCount = 0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_handleScroll);
  }

  @override
  void didUpdateWidget(covariant PurchasesListSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      oldWidget.scrollController.removeListener(_handleScroll);
      widget.scrollController.addListener(_handleScroll);
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_handleScroll);
    super.dispose();
  }

  void _handleScroll() {
    if (widget.scrollController.hasClients &&
        widget.scrollController.position.extentAfter < 250) {
      context.read<PurchasesRecentCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toLanguageTag();
    return BlocConsumer<PurchasesRecentCubit, PurchasesRecentState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            _lastItemCount = 0;
          },
          success: (data) {
            if (data.items.length != _lastItemCount) {
              _lastItemCount = data.items.length;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) _handleScroll();
              });
            }
          },
          error: (error) => DialogUtils.showMessage(
            context: context,
            type: DialogType.error,
            title: l10n.errorTitle,
            message: error.error?.message ?? l10n.genericError,
          ),
          orElse: () {},
        );
      },
      builder: (context, state) {
        final data = state.maybeWhen(
          success: (data) => data,
          loadingMore: (data) => data,
          orElse: () => null,
        );
        if (data == null) {
          return state.maybeWhen(
            loading: () => const PurchasesListShimmer(),
            orElse: () => const SizedBox.shrink(),
          );
        }
        final isLoadingMore = state.maybeWhen(
          loadingMore: (_) => true,
          orElse: () => false,
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  l10n.recentPurchases,
                  style: isDark
                      ? AppStyles.statTitleDark
                      : AppStyles.statTitleLight,
                ),
                SizedBox(width: 8.w),
                PurchasesCountBadge(count: data.count),
                const Spacer(),
                Text(
                  l10n.seeAll,
                  style:
                      (isDark
                              ? AppStyles.font12MediumDark
                              : AppStyles.font12MediumLight)
                          .copyWith(
                            color: isDark
                                ? AppColorsDark.primary
                                : AppColorsLight.primary,
                            fontWeight: FontWeight.w700,
                          ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            ...data.items.map((item) {
              final date = item.date;
              final dueDate = item.dueDate;
              final supplier = item.supplier ?? '-';
              final initials = supplier
                  .trim()
                  .split(RegExp(r'\s+'))
                  .where((part) => part.isNotEmpty)
                  .take(2)
                  .map((part) => part.substring(0, 1).toUpperCase())
                  .join();
              final status = switch (item.status?.toUpperCase()) {
                'PAID' => l10n.paid,
                'PARTIAL' => l10n.partial,
                'PENDING' => l10n.pending,
                _ => item.status ?? '-',
              };
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: PurchaseRecordCard(
                  record: PurchaseRecord(
                    name: supplier,
                    date: date == null
                        ? '-'
                        : DateFormat.yMMMd(locale).format(date),
                    invoice: item.invoiceNumber ?? '-',
                    amount: NumberFormat('#,##0.##', locale).format(item.total),
                    status: status,
                    initials: initials.isEmpty ? '-' : initials,
                    color: item.status?.toUpperCase() == 'PAID'
                        ? const Color(0xFF2DD4BF)
                        : item.status?.toUpperCase() == 'PARTIAL'
                        ? AppColorsLight.warningAlt
                        : AppColorsLight.primary,
                    remaining: item.remaining > 0
                        ? l10n.remainingAmount(
                            'EGP ${NumberFormat('#,##0.##', locale).format(item.remaining)}',
                          )
                        : null,
                    due: dueDate == null
                        ? null
                        : l10n.dueDate(
                            DateFormat.yMMMd(locale).format(dueDate),
                          ),
                  ),
                ),
              );
            }),
            if (isLoadingMore)
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    );
  }
}
