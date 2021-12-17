import 'package:domain/model/topic.dart';
import 'package:domain/repositories/topic_repository.dart';
import 'package:networking/api_service.dart';

const String TOPIC_BASE_URL = "topics";

class TopicRepositoryImpl implements TopicRepository {
  ApiService _apiService;

  TopicRepositoryImpl(this._apiService);

  @override
  Future<List<Topic>> getTopics() {
    return _apiService.get(TOPIC_BASE_URL).then((response) {
      List<Topic> newList =
          response.map<Topic>((e) => Topic.fromJson(e)).toList();
      return newList;
    }).catchError((error) {
      throw error;
    });
  }
}
