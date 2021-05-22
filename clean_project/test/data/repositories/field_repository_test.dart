import 'package:clean_project/src/data/repositories/FieldRepository.dart';
import 'package:clean_project/src/domain/entities/field/Field.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;

  group('Field Repository', () {
    late DioAdapter dioAdapter;
    late FieldRepositoryImpl fieldRepositoryImpl;

    setUpAll(() {
      dioAdapter = DioAdapter();
      dio = Dio()..httpClientAdapter = dioAdapter;
      fieldRepositoryImpl = FieldRepositoryImpl.test(dio);
    });

    test('Field Repository get fields', () async {
      dioAdapter.onGet("field/list",
          (request) => request.reply(200, [Field(name: "Field1")]));
      List<Field> fields = await fieldRepositoryImpl.getFields();

      expect(fields.isNotEmpty, true);
    });

    test('Field Repository get fields fail', () async {
      dioAdapter.onGet(
          "field/list",
          (request) => request.throws(500,
              DioError(requestOptions: RequestOptions(path: "field/list"))));

      var serviceError;
      await fieldRepositoryImpl.getFields().onError((error, stackTrace) {
        serviceError = error;
        return [];
      });
      expect(serviceError is DioError, true);
    });
  });
}
