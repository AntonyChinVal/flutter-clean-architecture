import 'package:components/button.dart';
import 'package:components/topic_item.dart';
import 'package:components/progress_modal.dart';
import 'package:flutter/material.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/screens/topics/topics_notifier.dart';
import 'package:screen/riverpod_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TopicsScreen extends ProviderScreen<TopicsNotifier> {
  final NavigationService? _navigationService;
  TopicsScreen(TopicsNotifier notifier, this._navigationService, {Key? key})
      : super(notifier, key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenProvider = ref.read(provider.notifier);
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
            itemCount: ref.watch(provider).topics.length,
            itemBuilder: (BuildContext context, int index) => TopicItem(
              title: ref.watch(provider).topics[index].name!,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Button(
          title: "Back",
          onPressed: () {
            _navigationService?.goBack();
          },
        ),
        ref.watch(provider).inAsyncCall
            ? const ProgressModal()
            : const SizedBox()
      ],
    )));
  }
}
