import 'package:flutter/material.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;

  const GradientScaffold({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
               ? [
                  AppColorsDark.primaryGradientStart,
                  AppColorsDark.primaryGradientEnd
                 ,
                  ]
                : [
                  AppColorsLight.primaryGradientStart,
                  AppColorsLight.primaryGradientEnd
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: body,
      ),
    );
  }
}