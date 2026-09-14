import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/management_section.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/profile_app_bar.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/profile_header_card.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/profile_stats_grid.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/store_information_section.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ProfileScrean extends StatelessWidget {
  const ProfileScrean({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = isDark
        ? AppColorsDark.background
        : AppColorsLight.background;
    final l10n = AppLocalizations.of(context)!;

    final stats = [
      ProfileStatData(value: '4', label: l10n.profileBranches),
      ProfileStatData(value: '28', label: l10n.profileEmployees),
      ProfileStatData(value: '12', label: l10n.profileCashiers),
      ProfileStatData(value: '94', label: l10n.profileSuppliers),
    ];

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                const ProfileAppBar(),
                SizedBox(height: 18.h),
                ProfileHeaderCard(
                  fullName: 'Marcus Bennett',
                  businessName: "Bennett's Retail Group",
                  roleLabel: l10n.profileOwnerRole,
                  editLabel: l10n.profileEdit,
                ),
                SizedBox(height: 18.h),
                 ProfileStatsGrid(items: stats),
                SizedBox(height: 22.h),
                const StoreInformationSection(),
                SizedBox(height: 22.h),
                const ManagementSection(),
                SizedBox(height: 22.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
