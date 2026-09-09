import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/di/injectoin.dart';
import 'package:skeleton_mobile_app/core/local/locale_cubit.dart';
import 'package:skeleton_mobile_app/core/routing/app_router.dart';
import 'package:skeleton_mobile_app/core/theming/app_theme_cubit.dart';
import 'package:skeleton_mobile_app/skeleton_app.dart';

void main() {
   configureDependencies();  

  runApp(
    MultiBlocProvider(
      providers: [
         BlocProvider(
      create: (_) => LocaleCubit(),
    ),
    BlocProvider(
      create: (_) => AppThemeCubit(),
    ),

      ],
      child: SkeletonApp(appRouter: AppRouter()),
    ),
  );
}
