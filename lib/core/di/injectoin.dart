import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:skeleton_mobile_app/core/di/injectoin.config.dart';


final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();