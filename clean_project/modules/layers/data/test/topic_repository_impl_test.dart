import 'package:data/repositories/topic_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/topic.dart';
import 'package:domain/repositories/topic_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
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
  var topics = [
    {"image": "Path", "name": "Test"}
  ];

  group('Topic Repository', () {
    late DioAdapter dioAdapter;
    late ApiService apiService;
    late LocalStorageService localStorageService;
    late TopicRepository topicRepository;

    setUpAll(() {
      dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      localStorageService = TestLocalStorageServiceImpl();
      apiService = ApiServiceImpl(dio, localStorageService);
      topicRepository = TopicRepositoryImpl(apiService);
    });

    test('getTopics', () async {
      dioAdapter.onGet("topics", (request) => request.reply(200, topics));
      List<Topic> list = await topicRepository.getTopics();
      expect(list.isNotEmpty, true);
    });
  });
}
