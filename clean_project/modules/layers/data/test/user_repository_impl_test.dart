import 'package:data/repositories/user_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/generic_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:local_storage/local_storage.dart';
import 'package:networking/api_service.dart';

class TestLocalStorageServiceImpl extends LocalStorageService {
  @override
  Future<String> getValue({required String key}) async {
    return "Test";
  }

  @override
  Future setValue({required String key, required String value}) async {}
}

void main() {
  late Dio dio;

  group('User Repository', () {
    late DioAdapter dioAdapter;
    late ApiService apiService;
    late LocalStorageService localStorageService;
    late UserRepository userRepository;

    setUpAll(() {
      dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      localStorageService = TestLocalStorageServiceImpl();
      apiService = ApiServiceImpl(dio, localStorageService);
      userRepository = UserRepositoryImpl(apiService, localStorageService);
    });

    test('getUser', () async {
      dioAdapter.onGet("user/get",
          (request) => request.reply(200, {"name": "", "lastname": ""}));
      GenericUser user = await userRepository.getUser();

      expect(user is GenericUser, true);
    });
    test('authenticate', () async {
      dioAdapter.onPost("authentication/authenticate",
          (request) => request.reply(200, "Token"),
          data: {"email": "Test", "password": "Test"});
      await userRepository.authenticate(email: "Test", password: "Test");
    });
  });
}
