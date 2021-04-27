// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repositories/FieldRepository.dart' as _i4;
import '../domain/repositories/FieldRepository.dart' as _i3;
import '../domain/usecases/GetFieldsUseCase.dart' as _i5;
import '../domain/usecases/LoginUseCase.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.FieldRepository>(() => _i4.FieldRepositoryImpl());
  gh.factory<_i5.GetFieldsUseCase>(
      () => _i5.GetFieldsUseCase(get<_i3.FieldRepository>()));
  gh.factory<_i6.LoginUseCase>(() => _i6.LoginUseCase());
  return get;
}
