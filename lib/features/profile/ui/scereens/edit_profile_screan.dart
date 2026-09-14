import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/edit_profile_widgets/edit_profile_actions.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/edit_profile_widgets/edit_profile_app_bar.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/edit_profile_widgets/edit_profile_business_section.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/edit_profile_widgets/edit_profile_hero.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/edit_profile_widgets/edit_profile_personal_section.dart';
import 'package:skeleton_mobile_app/features/profile/ui/widgets/edit_profile_widgets/edit_profile_security_section.dart';

class EditProfileScrean extends StatelessWidget {
  const EditProfileScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EditProfileAppBar(),
              SizedBox(height: 16.h),
              const EditProfileHero(),
              SizedBox(height: 20.h),
              const EditProfilePersonalSection(),
              SizedBox(height: 20.h),
              const EditProfileBusinessSection(),
              SizedBox(height: 20.h),
              const EditProfileSecuritySection(),
              SizedBox(height: 20.h),
              const EditProfileActions(),
            ],
          ),
        ),
      ),
    );
  }
}
