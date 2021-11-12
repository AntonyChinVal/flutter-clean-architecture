import 'package:domain/model/topic.dart';
import 'package:domain/use_cases/get_topics_use_case.dart';
import 'package:screen/controller_screen.dart';
import 'package:get/get.dart';

class TopicsController extends ScreenController {
  GetTopicsUseCase? _getTopicsUseCase;
  var topics = <Topic>[].obs;

  TopicsController({getTopicsUseCase: GetTopicsUseCase}) {
    this._getTopicsUseCase = getTopicsUseCase;
  }

  Future getTopics() async {
    try {
      this.startLoading();
      List<Topic>? response = await this._getTopicsUseCase?.execute();
      this.topics.value = response!;
      this.finishLoading();
    } catch (_) {
      this.finishLoading();
    }
  }
}
