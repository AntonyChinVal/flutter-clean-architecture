import 'package:clean_project/src/data/repositories/AppItemRepository.dart';
import 'package:clean_project/src/domain/entities/appItem/AppItem.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;

  group('AppItem Repository', () {
    late DioAdapter dioAdapter;
    late AppItemRepositoryImpl appItemRepositoryImpl;

    setUpAll(() {
      dioAdapter = DioAdapter();
      dio = Dio()..httpClientAdapter = dioAdapter;
      appItemRepositoryImpl = AppItemRepositoryImpl.test(dio);
    });

    test('AppItem Repository get items', () async {
      dioAdapter.onGet("field/list",
          (request) => request.reply(200, [AppItem(name: "AppItem1")]));
      List<AppItem> items = await appItemRepositoryImpl.getAppItems();

      expect(items.isNotEmpty, true);
    });

    test('AppItem Repository get items fail', () async {
      dioAdapter.onGet(
          "field/list",
          (request) => request.throws(500,
              DioError(requestOptions: RequestOptions(path: "field/list"))));

      var serviceError;
      await appItemRepositoryImpl.getAppItems().onError((error, stackTrace) {
        serviceError = error;
        return [];
      });
      expect(serviceError is DioError, true);
    });
  });
}
