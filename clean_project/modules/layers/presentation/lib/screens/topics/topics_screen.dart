import 'package:components/button.dart';
import 'package:components/topic_item.dart';
import 'package:components/progress_modal.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/screens/topics/topics_notifier.dart';
import 'package:screen/riverpod_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TopicsScreen extends ProviderScreen<TopicsNotifier> {
  final NavigationService? _navigationService;
  TopicsScreen(TopicsNotifier notifier, this._navigationService)
      : super(notifier);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenProvider = ref.read(this.provider.notifier);
    useEffect(
      () {
        screenProvider.getTopics();
      },
      [key],
    );

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: ref.watch(this.provider).topics.length,
            itemBuilder: (BuildContext context, int index) => TopicItem(
              title: ref.watch(this.provider).topics[index].name!,
            ),
          ),
        ),
        SizedBox(height: 20),
        Button(
          title: "Back",
          onPressed: () {
            this._navigationService?.goBack();
          },
        ),
        ref.watch(this.provider).inAsyncCall ? ProgressModal() : SizedBox()
      ],
    )));
  }
}
