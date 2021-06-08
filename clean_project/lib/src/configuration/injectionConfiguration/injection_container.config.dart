// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repositories/AppItemRepository.dart' as _i4;
import '../../data/repositories/AuthenticationRepository.dart' as _i6;
import '../../data/repositories/SharedPreferencesRepository.dart' as _i11;
import '../../data/repositories/UserRepository.dart' as _i12;
import '../../domain/repositories/AppItemRepository.dart' as _i3;
import '../../domain/repositories/AuthenticationRepository.dart' as _i5;
import '../../domain/repositories/SharedPreferencesRepository.dart' as _i10;
import '../../domain/repositories/UserRepository.dart' as _i9;
import '../../domain/usecases/GetAppItemsUseCase.dart' as _i7;
import '../../domain/usecases/LoginUseCase.dart' as _i8;
import '../../presentation/configuration/navigation/NavigationService.dart'
    as _i13;
import '../../presentation/configuration/navigation/RouteService.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AppItemRepository>(() => _i4.AppItemRepositoryImpl());
  gh.factory<_i5.AuthenticationRepository>(
      () => _i6.AuthenticationRepositoryImpl());
  gh.factory<_i7.GetAppItemsUseCase>(
      () => _i7.GetAppItemsUseCase(get<_i3.AppItemRepository>()));
  gh.factory<_i8.LoginUseCase>(() => _i8.LoginUseCase(
      get<_i5.AuthenticationRepository>(),
      get<_i9.UserRepository>(),
      get<_i10.SharedPreferencesRepository>()));
  gh.factory<_i10.SharedPreferencesRepository>(
      () => _i11.SharedPreferencesRepositoryImpl());
  gh.factory<_i9.UserRepository>(() => _i12.UserRepositoryImpl());
  gh.singleton<_i13.NavigationService>(_i13.NavigationService());
  gh.singleton<_i14.RouteService>(_i14.RouteService());
  return get;
}
