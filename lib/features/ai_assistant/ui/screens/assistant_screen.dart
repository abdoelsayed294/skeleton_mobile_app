import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/ai_assistant/ui/widgets/assistant_header.dart';
import 'package:skeleton_mobile_app/features/ai_assistant/ui/widgets/assistant_hold_to_speak.dart';
import 'package:skeleton_mobile_app/features/ai_assistant/ui/widgets/assistant_input_bar.dart';
import 'package:skeleton_mobile_app/features/ai_assistant/ui/widgets/assistant_mode_selector.dart';
import 'package:skeleton_mobile_app/features/ai_assistant/ui/widgets/assistant_question_tile.dart';
import 'package:skeleton_mobile_app/features/ai_assistant/ui/widgets/assistant_voice_orb.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class AssistantScreen extends StatelessWidget {
  const AssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final bodyStyle = isDark
        ? AppStyles.assistantBodyDark
        : AppStyles.assistantBodyLight;
    final questions = [
      l10n.assistantQuestionSales,
      l10n.assistantQuestionProducts,
      l10n.assistantQuestionRestock,
      l10n.assistantQuestionInventory,
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AssistantHeader(onBack: () => Navigator.pop(context)),
            AssistantModeSelector(
              labels: [l10n.askMode, l10n.listenMode, l10n.responseMode],
            ),
            SizedBox(height: 22.h),
            const AssistantVoiceOrb(),
            SizedBox(height: 18.h),
            Text(
              l10n.howCanHelp,
              style: isDark
                  ? AppStyles.assistantHeadlineDark
                  : AppStyles.assistantHeadlineLight,
            ),
            SizedBox(height: 5.h),
            Text(l10n.assistantHint, style: bodyStyle),
            SizedBox(height: 25.h),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Text(l10n.tryAsking, style: bodyStyle),
              ),
            ),
            SizedBox(height: 9.h),
            ...questions.map(
              (question) => AssistantQuestionTile(label: question),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(18.w, 8.h, 18.w, 16.h),
              child: Column(
                children: [
                  AssistantInputBar(hint: l10n.typeQuestion),
                  SizedBox(height: 9.h),
                  AssistantHoldToSpeak(label: l10n.holdToSpeak),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
