import 'dart:async';
import 'package:domain/core/use_case.dart';
import 'package:domain/model/topic.dart';
import 'package:domain/repositories/topic_repository.dart';

class GetTopicsUseCase extends NoParamUseCase<List<Topic>> {
  TopicRepository _topicRepository;

  GetTopicsUseCase(this._topicRepository) : super();

  @override
  Future<List<Topic>> execute() async {
    try {
      List<Topic> topics = await this._topicRepository.getTopics();
      return topics;
    } catch (ex) {
      throw ex;
    }
  }
}