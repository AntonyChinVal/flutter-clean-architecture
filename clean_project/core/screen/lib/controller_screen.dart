import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// [ControllerScreen]
///
abstract class ControllerScreen<CN extends GetxController> extends HookWidget {
  late final CN _controller;

  ControllerScreen(CN controller) {
    this._controller = controller;
    Get.put(this._controller);
  }

  CN get controller => this._controller;
}

/// [ScreenController]
///
abstract class ScreenController extends GetxController {
  var inAsyncCall = false.obs;

  startLoading() {
    this.inAsyncCall.value = true;
  }

  finishLoading() {
    this.inAsyncCall.value = false;
  }
}
