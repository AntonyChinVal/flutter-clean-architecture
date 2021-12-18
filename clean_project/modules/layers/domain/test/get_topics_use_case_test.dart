import 'package:domain/model/topic.dart';
import 'package:domain/repositories/topic_repository.dart';
import 'package:domain/use_cases/get_topics_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

class TestTopicRepository extends TopicRepository {
  @override
  Future<List<Topic>> getTopics() async {
    List<Topic> topics = [Topic(image: "Path", name: "Test")];
    return topics;
  }
}

void main() {
  group('Get Topics Use Case', () {
    late TopicRepository topicRepository;

    setUpAll(() {
      topicRepository = TestTopicRepository();
    });

    test('execute', () async {
      GetTopicsUseCase getTopicsUseCase = GetTopicsUseCase(topicRepository);
      List<Topic> topics = await getTopicsUseCase.execute();
      expect(topics.isNotEmpty, true);
    });
  });
}
