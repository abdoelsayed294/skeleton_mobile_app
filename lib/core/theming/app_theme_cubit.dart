import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/theming/app_theme_enum.dart';

class AppThemeCubit extends Cubit<AppThemeenum> {
  AppThemeCubit({AppThemeenum initialTheme = AppThemeenum.light})
    : super(initialTheme);

  void toggleTheme() {
    final nextTheme = state == AppThemeenum.light
        ? AppThemeenum.dark
        : AppThemeenum.light;
    emit(nextTheme);
    SharedPrefHelper.setData(
      SharedPrefHelper.themeKey,
      nextTheme == AppThemeenum.dark ? 'dark' : 'light',
    );
  }
}
