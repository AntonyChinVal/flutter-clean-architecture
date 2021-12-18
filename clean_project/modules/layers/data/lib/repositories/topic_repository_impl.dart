import 'package:domain/model/topic.dart';
import 'package:domain/repositories/topic_repository.dart';
import 'package:networking/api_service.dart';

const String topicBaseUrl = "topics";

class TopicRepositoryImpl implements TopicRepository {
  final ApiService _apiService;

  TopicRepositoryImpl(this._apiService);

  @override
  Future<List<Topic>> getTopics() {
    return _apiService.get(topicBaseUrl).then((response) {
      List<Topic> newList =
          response.map<Topic>((e) => Topic.fromJson(e)).toList();
      return newList;
    }).catchError((error) {
      throw error;
    });
  }
}
