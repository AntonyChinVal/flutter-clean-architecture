import 'package:data/repositories/topic_repository_impl.dart';
import 'package:data/repositories/user_repository_impl.dart';
import 'package:domain/repositories/topic_repository.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:local_storage/local_storage.dart';
import 'package:networking/networking.dart';
import 'package:presentation/navigation/route_service.dart';
import 'package:template/configuration/app_configuration/api_configuration.dart';
import 'package:template/configuration/app_configuration/route_configuration.dart';

final globalGetIt = GetIt.instance;

void configureInjection() {
  setupDataDependencies();
  setupPresentationDependencies();
  setupRepositories();
}

void setupDataDependencies() {
  globalGetIt.registerSingleton<LocalStorageService>(LocalStorageServiceImpl(),
      signalsReady: true);
  globalGetIt.registerSingleton<NetworkingService>(
      NetworkingServiceImpl(dioApi, globalGetIt<LocalStorageService>()),
      signalsReady: true);
}

void setupPresentationDependencies() {
  globalGetIt.registerSingleton<RouteService>(RouteServiceImpl(),
      signalsReady: true);
}

void setupRepositories() {
  globalGetIt.registerSingleton<UserRepository>(UserRepositoryImpl(
      globalGetIt<NetworkingService>(), globalGetIt<LocalStorageService>()));
  globalGetIt.registerSingleton<TopicRepository>(
      TopicRepositoryImpl(globalGetIt<NetworkingService>()));
}
