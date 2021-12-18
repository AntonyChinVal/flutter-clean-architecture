import 'package:domain/model/topic.dart';
import 'package:domain/use_cases/get_topics_use_case.dart';
import 'package:screen/riverpod_screen.dart';

class TopicsNotifier extends ScreenNotifier {
  GetTopicsUseCase? _getTopicsUseCase;
  var topics = <Topic>[];

  TopicsNotifier({GetTopicsUseCase? getTopicsUseCase}) {
    _getTopicsUseCase = getTopicsUseCase;
  }

  Future getTopics() async {
    try {
      startLoading();
      List<Topic>? response = await _getTopicsUseCase?.execute();
      topics = response!;
      finishLoading();
    } catch (_) {
      finishLoading();
    }
  }
}
