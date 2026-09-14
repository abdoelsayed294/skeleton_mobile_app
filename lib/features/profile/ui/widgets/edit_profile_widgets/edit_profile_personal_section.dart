import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/edit_profile_widgets/edit_profile_field.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/edit_profile_widgets/edit_profile_section_card.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class EditProfilePersonalSection extends StatelessWidget {
  const EditProfilePersonalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return EditProfileSectionCard(
      title: l10n.personalInformation,
      icon: Icons.person_rounded,
      children: [
        EditProfileField(
          label: l10n.fullName,
          value: 'Marcus Bennett',
          icon: Icons.badge_outlined,
        ),
        SizedBox(height: 14.h),
        EditProfileField(
          label: l10n.emailAddress,
          value: 'marcus.bennett@retailgroup.com',
          icon: Icons.alternate_email_rounded,
        ),
        SizedBox(height: 14.h),
        EditProfileField(
          label: l10n.phoneNumber,
          value: '+1 (555) 204-8831',
          icon: Icons.phone_outlined,
        ),
      ],
    );
  }
}
