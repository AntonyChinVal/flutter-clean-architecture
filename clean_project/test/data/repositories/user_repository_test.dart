import 'package:clean_project/src/data/repositories/UserRepository.dart';
import 'package:clean_project/src/domain/entities/user/AppUser.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;

  group('User Repository', () {
    late DioAdapter dioAdapter;
    late UserRepositoryImpl userRepositoryImpl;

    setUpAll(() {
      dioAdapter = DioAdapter();
      dio = Dio()..httpClientAdapter = dioAdapter;
      userRepositoryImpl = UserRepositoryImpl.test(dio);
    });

    test('User Repository get user', () async {
      dioAdapter.onGet("user/get", (request) => request.reply(200, AppUser()));
      AppUser user = await userRepositoryImpl.getUser();

      expect(user is AppUser, true);
    });

    test('User Repository get user fail', () async {
      dioAdapter.onGet(
          "user/get",
          (request) => request.throws(
              500, DioError(requestOptions: RequestOptions(path: "user/get"))));

      var serviceError;
      await userRepositoryImpl.getUser().onError((error, stackTrace) {
        serviceError = error;
        return AppUser();
      });
      expect(serviceError is DioError, true);
    });
  });
}
