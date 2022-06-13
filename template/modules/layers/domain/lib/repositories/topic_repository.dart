import 'package:domain/entity/topic_entity.dart';

abstract class TopicRepository {
  Future<List<Topic>> getTopics();
}
