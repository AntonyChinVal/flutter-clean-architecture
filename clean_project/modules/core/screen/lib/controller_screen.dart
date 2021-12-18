import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// [ControllerScreen]
///
abstract class ControllerScreen<CN extends GetxController> extends HookWidget {
  late final CN _controller;

  ControllerScreen(CN controller, {Key? key}) : super(key: key) {
    _controller = controller;
    Get.put(_controller);
  }

  CN get controller => _controller;
}

/// [ScreenController]
///
abstract class ScreenController extends GetxController {
  var inAsyncCall = false.obs;

  startLoading() {
    inAsyncCall.value = true;
  }

  finishLoading() {
    inAsyncCall.value = false;
  }
}
