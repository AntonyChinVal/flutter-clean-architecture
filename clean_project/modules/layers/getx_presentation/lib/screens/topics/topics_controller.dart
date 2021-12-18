import 'package:domain/model/topic.dart';
import 'package:domain/use_cases/get_topics_use_case.dart';
import 'package:screen/controller_screen.dart';
import 'package:get/get.dart';

class TopicsController extends ScreenController {
  GetTopicsUseCase? _getTopicsUseCase;
  var topics = <Topic>[].obs;

  TopicsController({GetTopicsUseCase? getTopicsUseCase}) {
    _getTopicsUseCase = getTopicsUseCase;
  }

  Future getTopics() async {
    try {
      startLoading();
      List<Topic>? response = await _getTopicsUseCase?.execute();
      topics.value = response!;
      finishLoading();
    } catch (_) {
      finishLoading();
    }
  }
}
