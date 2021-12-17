import 'package:components/button.dart';
import 'package:components/topic_item.dart';
import 'package:components/progress_modal.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getx_presentation/screens/topics/topics_controller.dart';
import 'package:flutter/material.dart';
import 'package:screen/controller_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GetXTopicsScreen extends ControllerScreen<TopicsController> {
  GetXTopicsScreen(TopicsController controller) : super(controller);

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        this.controller.getTopics();
      },
      [key],
    );

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        Expanded(
          child: Obx(() => ListView.builder(
                itemCount: this.controller.topics.length,
                itemBuilder: (BuildContext context, int index) => TopicItem(
                  title: this.controller.topics[index].name!,
                ),
              )),
        ),
        SizedBox(height: 20),
        Button(
          title: "Back",
          onPressed: () {
            Get.back();
          },
        ),
        Obx(() =>
            this.controller.inAsyncCall.value ? ProgressModal() : SizedBox())
      ],
    )));
  }
}
