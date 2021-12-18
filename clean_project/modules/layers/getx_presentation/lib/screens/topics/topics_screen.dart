import 'package:getx_presentation/screens/topics/topics_controller.dart';
import 'package:flutter/material.dart';
import 'package:screen/controller_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/components/button.dart';
import 'package:ui/components/progress_modal.dart';
import 'package:ui/components/topic_item.dart';

class GetXTopicsScreen extends ControllerScreen<TopicsController> {
  GetXTopicsScreen(TopicsController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        controller.getTopics();
      },
      [key],
    );

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        Expanded(
          child: Obx(() => ListView.builder(
                itemCount: controller.topics.length,
                itemBuilder: (BuildContext context, int index) => TopicItem(
                  title: controller.topics[index].name!,
                ),
              )),
        ),
        const SizedBox(height: 20),
        Button(
          title: "Back",
          onPressed: () {
            Get.back();
          },
        ),
        Obx(() => controller.inAsyncCall.value
            ? const ProgressModal()
            : const SizedBox())
      ],
    )));
  }
}
