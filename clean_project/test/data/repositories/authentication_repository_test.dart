import 'dart:convert';

import 'package:clean_project/src/data/repositories/AuthenticationRepository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;

  group('DioAdapter', () {
    late DioAdapter dioAdapter;
    late AuthenticationRepositoryImpl authenticationRepositoryImpl;

    setUpAll(() {
      dioAdapter = DioAdapter();
      dio = Dio()..httpClientAdapter = dioAdapter;
      authenticationRepositoryImpl = AuthenticationRepositoryImpl.test(dio);
    });

    test('mocks the data', () async {
      dioAdapter.onPost("authentication/authenticate",
          (request) => request.reply(200, "Token"));
      String token = await authenticationRepositoryImpl.authenticate(
          email: "Test", password: "Test");

      expect(jsonDecode(token), "Token");
    });
  });
}
