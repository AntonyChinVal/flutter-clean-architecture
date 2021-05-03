// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repositories/AuthenticationRepository.dart' as _i4;
import '../data/repositories/FieldRepository.dart' as _i6;
import '../data/repositories/UserRepository.dart' as _i9;
import '../domain/repositories/AuthenticationRepository.dart' as _i3;
import '../domain/repositories/FieldRepository.dart' as _i5;
import '../domain/repositories/UserRepository.dart' as _i8;
import '../domain/usecases/GetFieldsUseCase.dart' as _i7;
import '../domain/usecases/LoginUseCase.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthenticationRepository>(
      () => _i4.AuthenticationRepositoryImpl());
  gh.factory<_i5.FieldRepository>(() => _i6.FieldRepositoryImpl());
  gh.factory<_i7.GetFieldsUseCase>(
      () => _i7.GetFieldsUseCase(get<_i5.FieldRepository>()));
  gh.factory<_i8.UserRepository>(() => _i9.UserRepositoryImpl());
  gh.factory<_i10.LoginUseCase>(() => _i10.LoginUseCase(
      get<_i3.AuthenticationRepository>(), get<_i8.UserRepository>()));
  return get;
}
