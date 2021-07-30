import 'package:clean_project/src/configuration/app_configuration/app_configuration.dart';
import 'package:clean_project/src/configuration/env_configuration/env_configuration.dart';
import 'package:clean_project/src/configuration/injection_configuration/injection_container.dart';

void main() async {
  await configureEnv();
  configureInjection();
  configureApp();
}
