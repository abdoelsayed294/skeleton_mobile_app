import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/edit_profile_widgets/edit_profile_field.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/edit_profile_widgets/edit_profile_section_card.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class EditProfileBusinessSection extends StatelessWidget {
  const EditProfileBusinessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return EditProfileSectionCard(
      title: l10n.storeBusinessDetails,
      icon: Icons.storefront_rounded,
      children: [
        EditProfileField(
          label: l10n.storeName,
          value: "Bennett's Retail Group",
          icon: Icons.business_outlined,
        ),
        SizedBox(height: 14.h),
        EditProfileField(
          label: l10n.storeAddressPrimaryBranch,
          value: '124 Commerce Ave, NY 10001',
          icon: Icons.location_on_outlined,
        ),
        SizedBox(height: 14.h),
        EditProfileField(
          label: l10n.businessType,
          value: 'Retail - Multi-Branch',
          icon: Icons.account_tree_outlined,
          isDropdown: true,
        ),
        SizedBox(height: 14.h),
        EditProfileField(
          label: l10n.taxCommercialRegNumber,
          value: l10n.taxRegistrationNumber,
          icon: Icons.receipt_long_outlined,
        ),
      ],
    );
  }
}
