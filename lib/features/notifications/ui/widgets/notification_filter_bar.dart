import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/notifications/ui/widgets/notification_filter_chip.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class NotificationFilterBar extends StatelessWidget {
  const NotificationFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          NotificationFilterChip(
            label: l10n.notificationsAll,
            count: '12',
            selected: true,
          ),
          SizedBox(width: 8.w),
          NotificationFilterChip(
            label: l10n.inventoryAndStock,
            icon: Icons.inventory_2_outlined,
            selected: false,
          ),
          SizedBox(width: 8.w),
          NotificationFilterChip(
            label: l10n.ordersAndSales,
            icon: Icons.storefront_outlined,
            selected: false,
          ),
        ],
      ),
    );
  }
}
