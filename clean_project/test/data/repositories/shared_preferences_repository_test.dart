import 'package:clean_project/src/data/repositories/SharedPreferencesRepository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SharedPreferences Repository', () {
    late SharedPreferencesRepositoryImpl sharedPreferencesRepositoryImpl;

    setUpAll(() {
      sharedPreferencesRepositoryImpl = SharedPreferencesRepositoryImpl();
    });

    test('SharedPreferences Repository setValue', () async {
      try {
        await sharedPreferencesRepositoryImpl.setValue(
            key: "test", value: "value");
      } catch (ex) {
        expect(ex.toString().isEmpty, false);
      }
    });

    test('SharedPreferences Repository getValue', () async {
      try {
        String value = await sharedPreferencesRepositoryImpl.getValue();
      } catch (ex) {
        expect(ex.toString().isEmpty, false);
      }
    });
  });
}
