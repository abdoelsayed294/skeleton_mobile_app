import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/theming/app_theme_enum.dart';

class AppThemeCubit extends Cubit<AppThemeenum> {
  AppThemeCubit() : super(AppThemeenum.light);

  void toggleTheme() {
    emit(
      state == AppThemeenum.light ? AppThemeenum.dark : AppThemeenum.light,
    );
  }
}