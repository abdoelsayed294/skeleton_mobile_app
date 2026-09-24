import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_activity_cubit.dart';
import 'package:skeleton_mobile_app/features/product_details/logic/product_activity_state.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/activity_row.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_details_section_shimmer.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ActivityEntry {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String value;
  final String time;

  const ActivityEntry({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.value,
    this.time = '',
  });
}

class ProductActivitySection extends StatelessWidget {
  const ProductActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final warning = isDark ? AppColorsDark.warningAlt : AppColorsLight.warning;
    final error = isDark ? AppColorsDark.error : AppColorsLight.error;
    final success = isDark ? AppColorsDark.success : AppColorsLight.success;

    return BlocConsumer<ProductActivityCubit, ProductActivityState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (error) => DialogUtils.showMessage(
            context: context,
            type: DialogType.error,
            title: l10n.errorTitle,
            message: error.error?.message ?? l10n.genericError,
          ),
          orElse: () {},
        );
      },
      builder: (context, state) => state.maybeWhen(
        initial: () => Column(
          children: [
            const ProductDetailsSectionShimmer(height: 90),
            SizedBox(height: 10.h),
            const ProductDetailsSectionShimmer(height: 90),
            SizedBox(height: 10.h),
            const ProductDetailsSectionShimmer(height: 90),
          ],
        ),
        loading: () => Column(
          children: [
            const ProductDetailsSectionShimmer(height: 90),
            SizedBox(height: 10.h),
            const ProductDetailsSectionShimmer(height: 90),
            SizedBox(height: 10.h),
            const ProductDetailsSectionShimmer(height: 90),
          ],
        ),
        success: (data) {
          final entries = [
            ActivityEntry(
              icon: Icons.sell_outlined,
              color: primary,
              title: 'Units Sold',
              subtitle: data.itemName,
              value: '${data.sold}',
            ),
            ActivityEntry(
              icon: Icons.shopping_cart_outlined,
              color: success,
              title: 'Units Purchased',
              subtitle: data.itemName,
              value: '${data.purchased}',
            ),
            ActivityEntry(
              icon: Icons.warning_amber_rounded,
              color: warning,
              title: 'Damaged',
              subtitle: data.itemName,
              value: '${data.damaged}',
            ),
            ActivityEntry(
              icon: Icons.assignment_return_outlined,
              color: error,
              title: 'Sales Return',
              subtitle: data.itemName,
              value: '${data.salesReturn}',
            ),
            ActivityEntry(
              icon: Icons.keyboard_return_rounded,
              color: warning,
              title: 'Purchase Return',
              subtitle: data.itemName,
              value: '${data.purchaseReturn}',
            ),
          ];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'RECENT ACTIVITY',
                style: isDark
                    ? AppStyles.statTitleDark
                    : AppStyles.statTitleLight,
              ),
              SizedBox(height: 10.h),
              ...entries.map(
                (entry) => Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: ActivityRow(entry: entry),
                ),
              ),
            ],
          );
        },
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
