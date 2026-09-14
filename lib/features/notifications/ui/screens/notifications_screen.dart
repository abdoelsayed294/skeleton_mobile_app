import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/notifications/ui/widgets/activity_stream_card.dart';
import 'package:skeleton_mobile_app/features/notifications/ui/widgets/notification_app_bar.dart';
import 'package:skeleton_mobile_app/features/notifications/ui/widgets/notification_filter_bar.dart';
import 'package:skeleton_mobile_app/features/notifications/ui/widgets/notification_group.dart';
import 'package:skeleton_mobile_app/features/notifications/ui/widgets/notification_preferences_card.dart';
import 'package:skeleton_mobile_app/features/notifications/ui/widgets/notification_tile.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final primary = isDark ? AppColorsDark.primary : AppColorsLight.primary;
    final error = isDark ? AppColorsDark.error : AppColorsLight.error;
    final success = isDark ? AppColorsDark.success : AppColorsLight.success;
    final mutedBlue = isDark
        ? AppColorsDark.primaryAlt
        : const Color(0xFF9BCBFF);

    return Scaffold(
      backgroundColor: isDark
          ? AppColorsDark.background
          : AppColorsLight.background,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 24.h),
          children: [
            const NotificationAppBar(),
            SizedBox(height: 12.h),
            const ActivityStreamCard(unreadCount: 2),
            SizedBox(height: 16.h),
            const NotificationFilterBar(),
            SizedBox(height: 18.h),
            NotificationGroup(
              title: l10n.notificationToday,
              countLabel: l10n.notificationTodayCount,
              items: [
                NotificationTile(
                  icon: Icons.warning_amber_rounded,
                  accent: error,
                  title: l10n.notificationLowStockTitle,
                  body: l10n.notificationLowStockBody,
                  time: l10n.notificationTenMinutesAgo,
                  tags: [
                    l10n.notificationThreeLeft,
                    l10n.notificationQuickReorder,
                  ],
                  unread: true,
                ),
                NotificationTile(
                  icon: Icons.local_shipping_outlined,
                  accent: mutedBlue,
                  title: l10n.notificationPurchaseTitle,
                  body: l10n.notificationPurchaseBody,
                  time: l10n.notificationOneHourAgo,
                  tags: [
                    l10n.notificationPoNumber,
                    l10n.notificationFiftyUnits,
                  ],
                  unread: true,
                ),
                NotificationTile(
                  icon: Icons.auto_graph_rounded,
                  accent: primary,
                  title: l10n.notificationTargetTitle,
                  body: l10n.notificationTargetBody,
                  time: l10n.notificationThreeHoursAgo,
                  tags: [l10n.notificationGoal, l10n.notificationRevenue],
                ),
              ],
            ),
            NotificationGroup(
              title: l10n.notificationYesterday,
              countLabel: l10n.notificationYesterdayCount,
              items: [
                NotificationTile(
                  icon: Icons.payments_outlined,
                  accent: primary,
                  title: l10n.notificationPaymentTitle,
                  body: l10n.notificationPaymentBody,
                  time: l10n.notificationPaymentTime,
                  tags: [
                    l10n.notificationInvoice,
                    l10n.notificationPaymentAmount,
                  ],
                ),
                NotificationTile(
                  icon: Icons.assignment_ind_outlined,
                  accent: mutedBlue,
                  title: l10n.notificationShiftTitle,
                  body: l10n.notificationShiftBody,
                  time: l10n.notificationShiftTime,
                  tags: [l10n.notificationTerminal, l10n.notificationOperator],
                ),
              ],
            ),
            NotificationGroup(
              title: l10n.notificationEarlier,
              dateLabel: l10n.notificationEarlierDate,
              items: [
                NotificationTile(
                  icon: Icons.cloud_done_outlined,
                  accent: success,
                  title: l10n.notificationBackupTitle,
                  body: l10n.notificationBackupBody,
                  time: l10n.notificationBackupDate,
                  tags: [l10n.notificationVerified, l10n.notificationStorage],
                ),
              ],
            ),
            const NotificationPreferencesCard(),
          ],
        ),
      ),
    );
  }
}
