import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/local/locale_cubit.dart';
import 'package:skeleton_mobile_app/core/routing/app_router.dart';
import 'package:skeleton_mobile_app/core/routing/routes.dart';
import 'package:skeleton_mobile_app/core/theming/app_theme.dart';
import 'package:skeleton_mobile_app/core/theming/app_theme_cubit.dart';
import 'package:skeleton_mobile_app/core/theming/app_theme_enum.dart';
import 'l10n/app_localizations.dart';

class SkeletonApp extends StatelessWidget {
  final AppRouter appRouter;
  const SkeletonApp({super.key, required this.appRouter});

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
                  initialRoute: Routes.mainScreen,
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
