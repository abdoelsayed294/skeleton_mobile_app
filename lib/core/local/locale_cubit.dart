import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/helpers/shared_pref_helper.dart';
import 'package:skeleton_mobile_app/core/local/app_language.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit({Locale initialLocale = const Locale('en')})
    : super(initialLocale);

  void changeLanguage(AppLanguage language) {
    switch (language) {
      case AppLanguage.arabic:
        emit(const Locale('ar'));
        SharedPrefHelper.setData(SharedPrefHelper.languageKey, 'ar');
      case AppLanguage.english:
        emit(const Locale('en'));
        SharedPrefHelper.setData(SharedPrefHelper.languageKey, 'en');
    }
  }
}
