import 'package:clean_project/src/configuration/app_configuration/route_configuration.dart';
import 'package:data/api/api_service.dart';
import 'package:data/device/shared_preferences_service.dart';
import 'package:data/repositories/item_repository_impl.dart';
import 'package:data/repositories/user_repository_impl.dart';
import 'package:domain/repositories/generic_item_repository.dart';
import 'package:domain/repositories/generic_user_repository.dart';
import 'package:domain/use_cases/get_items_use_case.dart';
import 'package:domain/use_cases/login_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/configuration/navigation/route_service.dart';

final getIt = GetIt.instance;

void configureInjection() {
  setupDataDependencies();
  setupPresentationDependencies();
  setupRepositories();
  setupUsecases();
}

void setupDataDependencies() {
  getIt.registerSingleton<SharedPreferencesService>(
      SharedPreferencesServiceImpl(),
      signalsReady: true);
  getIt.registerSingleton<ApiService>(
      ApiServiceImpl(dioApi, getIt<SharedPreferencesService>()),
      signalsReady: true);
}

void setupPresentationDependencies() {
  getIt.registerSingleton<NavigationService>(NavigationServiceImpl(),
      signalsReady: true);
  getIt.registerSingleton<RouteService>(RouteServiceImpl(), signalsReady: true);
}

void setupRepositories() {
  getIt.registerFactory<UserRepository>(() => UserRepositoryImpl(
      getIt<ApiService>(), getIt<SharedPreferencesService>()));
  getIt.registerFactory<ItemRepository>(
      () => ItemRepositoryImpl(getIt<ApiService>()));
}

void setupUsecases() {
  getIt.registerFactory<LoginUseCase>(
      () => LoginUseCase(getIt<UserRepository>()));
  getIt.registerFactory<GetItemsUseCase>(
      () => GetItemsUseCase(getIt<ItemRepository>()));
}
