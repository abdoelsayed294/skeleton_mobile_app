import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/local/locale_cubit.dart';
import 'package:skeleton_mobile_app/core/routing/app_router.dart';
import 'package:skeleton_mobile_app/core/theming/app_theme.dart';
import 'package:skeleton_mobile_app/core/theming/app_theme_cubit.dart';
import 'package:skeleton_mobile_app/core/theming/app_theme_enum.dart';
import 'package:skeleton_mobile_app/features/splash/ui/screens/splash_screen.dart';
import 'l10n/app_localizations.dart';

class SkeletonApp extends StatelessWidget {
  final AppRouter appRouter;
  // The route to open right after the splash animation finishes
  // (e.g. the QR-scan screen or the main screen).
  final String initialRoute;

  SkeletonApp({super.key, required this.appRouter, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) {
            return BlocBuilder<AppThemeCubit, AppThemeenum>(
              builder: (context, theme) {
                return MaterialApp(
                  title: 'Skeleton App',
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: theme == AppThemeenum.light
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  onGenerateRoute: appRouter.generateRoute,
                  home: SplashScreen(nextRoute: initialRoute),
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  locale: locale,
                );
              },
            );
          }, 
        );
      },
    );
  }
}
