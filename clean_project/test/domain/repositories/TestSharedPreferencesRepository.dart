import 'package:clean_project/src/domain/repositories/SharedPreferencesRepository.dart';

class TestSharedPreferencesRepository extends SharedPreferencesRepository {
  @override
  Future<String> getValue({String? key}) {
    return Future.delayed(
      Duration(seconds: 1),
      () => 'Value',
    );
  }

  @override
  Future<void> setValue({String? key, String? value}) {
    return Future.delayed(
      Duration(seconds: 2),
      () {},
    );
  }
}
