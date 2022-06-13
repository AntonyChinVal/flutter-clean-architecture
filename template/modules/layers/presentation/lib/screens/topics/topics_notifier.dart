import 'package:domain/entity/topic_entity.dart';
import 'package:domain/repositories/topic_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:presentation/app.dart';

final topicsProvider = ChangeNotifierProvider.autoDispose(
    (_) => TopicsNotifier(topicRepository: getIt<TopicRepository>()));

class TopicsNotifier extends ChangeNotifier {
  TopicRepository? _topicRepository;
  bool inAsyncCall = false;
  var topics = <Topic>[];

  TopicsNotifier({TopicRepository? topicRepository}) {
    _topicRepository = topicRepository;
  }

  Future getTopics() async {
    try {
      inAsyncCall = true;
      List<Topic>? response = await _topicRepository?.getTopics();
      topics = response!;
      inAsyncCall = false;
      notifyListeners();
    } catch (_) {
      topics = [];
      inAsyncCall = false;
      notifyListeners();
    }
  }
}
