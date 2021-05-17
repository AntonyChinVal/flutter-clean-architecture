// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repositories/AuthenticationRepository.dart' as _i4;
import '../../data/repositories/FieldRepository.dart' as _i7;
import '../../data/repositories/UserRepository.dart' as _i11;
import '../../domain/repositories/AuthenticationRepository.dart' as _i3;
import '../../domain/repositories/FieldRepository.dart' as _i6;
import '../../domain/repositories/UserRepository.dart' as _i10;
import '../../domain/usecases/FacebookLoginUseCase.dart' as _i5;
import '../../domain/usecases/GetFieldsUseCase.dart' as _i8;
import '../../domain/usecases/GoogleLoginUseCase.dart' as _i9;
import '../../domain/usecases/LoginUseCase.dart' as _i12;
import '../../presentation/configuration/navigation/NavigationService.dart'
    as _i13;
import '../../presentation/configuration/navigation/RouteService.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthenticationRepository>(
      () => _i4.AuthenticationRepositoryImpl());
  gh.factory<_i5.FacebookLoginUseCase>(
      () => _i5.FacebookLoginUseCase(get<_i3.AuthenticationRepository>()));
  gh.factory<_i6.FieldRepository>(() => _i7.FieldRepositoryImpl());
  gh.factory<_i8.GetFieldsUseCase>(
      () => _i8.GetFieldsUseCase(get<_i6.FieldRepository>()));
  gh.factory<_i9.GoogleLoginUseCase>(
      () => _i9.GoogleLoginUseCase(get<_i3.AuthenticationRepository>()));
  gh.factory<_i10.UserRepository>(() => _i11.UserRepositoryImpl());
  gh.factory<_i12.LoginUseCase>(() => _i12.LoginUseCase(
      get<_i3.AuthenticationRepository>(), get<_i10.UserRepository>()));
  gh.singleton<_i13.NavigationService>(_i13.NavigationService());
  gh.singleton<_i14.RouteService>(_i14.RouteService());
  return get;
}