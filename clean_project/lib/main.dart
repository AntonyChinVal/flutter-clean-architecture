
import 'package:clean_project/src/configuration/appConfiguration/app_configuration.dart';
import 'package:clean_project/src/configuration/envConfiguration/env_configuration.dart';
import 'package:clean_project/src/configuration/firebaseConfiguration/firebase_configuration.dart';
import 'package:clean_project/src/configuration/injectionConfiguration/injection_container.dart';

void main() async{
  await configureEnv();
  configureInjection();
  configureFirebase();
  configureApp();
}