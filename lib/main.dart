import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton/core/di/injectoin.dart';
import 'package:skeleton/core/helpers/shared_pref_helper.dart';
import 'package:skeleton/core/local/locale_cubit.dart';
import 'package:skeleton/core/routing/app_router.dart';
import 'package:skeleton/core/routing/routes.dart';
import 'package:skeleton/core/theming/app_theme_cubit.dart';
import 'package:skeleton/core/theming/app_theme_enum.dart';
import 'package:skeleton/skeleton_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  final savedLanguage = await SharedPrefHelper.getString(
    SharedPrefHelper.languageKey,
  );
  final savedTheme = await SharedPrefHelper.getString(
    SharedPrefHelper.themeKey,
  );

  final qrStatus = await SharedPrefHelper.getString(
    SharedPrefHelper.qrStatusKey,
  );
  String initialRoute;
  if (qrStatus?.toLowerCase() == 'approved') {
    initialRoute = Routes.branchSelectionScreen;
  } else {
    initialRoute = Routes.scanQrScreen;
  }
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LocaleCubit(
            initialLocale: savedLanguage == 'ar'
                ? const Locale('ar')
                : const Locale('en'),
          ),
        ),
        BlocProvider(
          create: (_) => AppThemeCubit(
            initialTheme: savedTheme == 'dark'
                ? AppThemeenum.dark
                : AppThemeenum.light,
          ),
        ),
      ],
      child: SkeletonApp(appRouter: AppRouter(), initialRoute: initialRoute),
    ),
  );
}
