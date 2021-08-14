import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'screen.dart';
import 'package:get/get.dart';

/// [ControllerScreen]
///
abstract class ControllerScreen<CN extends GetxController> extends Screen {
  late final CN _controller;

  ControllerScreen(CN controller) {
    this._controller = controller;
    Get.put(this._controller);
  }

  @override
  Widget build(BuildContext context) {
    return this.buildTemplate(context);
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
