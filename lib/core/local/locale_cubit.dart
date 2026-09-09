import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/local/app_language.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en'));
  void changeLanguage(AppLanguage language) {
    switch (language) {
      case AppLanguage.arabic:
        emit(const Locale('ar'));
      case AppLanguage.english:
        emit(const Locale('en'));
    }
  }
}