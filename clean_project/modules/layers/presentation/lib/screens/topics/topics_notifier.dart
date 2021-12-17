import 'package:domain/model/topic.dart';
import 'package:domain/use_cases/get_topics_use_case.dart';
import 'package:screen/riverpod_screen.dart';

class TopicsNotifier extends ScreenNotifier {
  GetTopicsUseCase? _getTopicsUseCase;
  var topics = <Topic>[];

  TopicsNotifier({getTopicsUseCase: GetTopicsUseCase}) {
    this._getTopicsUseCase = getTopicsUseCase;
  }

  Future getTopics() async {
    try {
      this.startLoading();
      List<Topic>? response = await this._getTopicsUseCase?.execute();
      this.topics = response!;
      this.finishLoading();
    } catch (_) {
      this.finishLoading();
    }
  }
}
