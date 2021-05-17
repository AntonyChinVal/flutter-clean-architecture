import 'package:clean_project/src/configuration/injectionConfiguration/injection_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection() => $initGetIt(getIt);