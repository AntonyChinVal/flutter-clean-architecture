import 'package:clean_project/src/configuration/app_configuration/getx_route_configuration.dart';
import 'package:clean_project/src/configuration/app_configuration/route_configuration.dart';
import 'package:data/api/api_service.dart';
import 'package:data/device/local_storage_service.dart';
import 'package:data/repositories/topic_repository_impl.dart';
import 'package:data/repositories/user_repository_impl.dart';
import 'package:domain/repositories/topic_repository.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:domain/use_cases/login_use_case.dart';
import 'package:domain/use_cases/get_topics_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:getx_presentation/configuration/navigation/route_service.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/configuration/navigation/route_service.dart';

final getIt = GetIt.instance;

void configureInjection() {
  setupDataDependencies();
  setupPresentationDependencies();
  setupGetXPresentationDependencies();
  setupRepositories();
  setupUsecases();
}

void setupDataDependencies() {
  getIt.registerSingleton<LocalStorageService>(LocalStorageServiceImpl(),
      signalsReady: true);
  getIt.registerSingleton<ApiService>(
      ApiServiceImpl(dioApi, getIt<LocalStorageService>()),
      signalsReady: true);
}

void setupPresentationDependencies() {
  getIt.registerSingleton<NavigationService>(NavigationServiceImpl(),
      signalsReady: true);
  getIt.registerSingleton<RouteService>(RouteServiceImpl(), signalsReady: true);
}

void setupGetXPresentationDependencies() {
  getIt.registerSingleton<GetXRouteService>(GetXRouteServiceImpl(),
      signalsReady: true);
}

void setupRepositories() {
  getIt.registerFactory<UserRepository>(() =>
      UserRepositoryImpl(getIt<ApiService>(), getIt<LocalStorageService>()));

  getIt.registerFactory<TopicRepository>(
      () => TopicRepositoryImpl(getIt<ApiService>()));
}

void setupUsecases() {
  getIt.registerFactory<LoginUseCase>(
      () => LoginUseCase(getIt<UserRepository>()));
  getIt.registerFactory<GetTopicsUseCase>(
      () => GetTopicsUseCase(getIt<TopicRepository>()));
}
