import 'package:data/api/api_service.dart';
import 'package:domain/model/generic_user/topic.dart';
import 'package:domain/repositories/topic_repository.dart';

class TopicRepositoryImpl implements TopicRepository {
  ApiService _apiService;

  TopicRepositoryImpl(this._apiService);

  @override
  Future<List<Topic>> getTopics() {
    return _apiService.get("topics").then((response) {
      List<Topic> list = response.data!
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList();
      return list;
    }).catchError((error) {
      throw error;
    });
  }
}
