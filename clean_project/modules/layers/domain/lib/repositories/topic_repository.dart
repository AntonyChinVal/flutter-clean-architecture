import 'package:domain/model/topic.dart';

abstract class TopicRepository {
  Future<List<Topic>> getTopics();
}
