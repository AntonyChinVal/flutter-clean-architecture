import 'package:domain/entity/topic_entity.dart';
import 'package:domain/repositories/topic_repository.dart';
import 'package:networking/networking.dart';

const String topicBaseUrl = "topics";

class TopicRepositoryImpl implements TopicRepository {
  final NetworkingService _apiService;

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
