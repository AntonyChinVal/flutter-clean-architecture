import 'package:domain/model/generic_user/topic.dart';

abstract class TopicRepository {
  Future<List<Topic>> getTopics();
}
