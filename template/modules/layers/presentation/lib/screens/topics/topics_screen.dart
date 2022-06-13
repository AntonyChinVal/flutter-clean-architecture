import 'package:core/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/screens/topics/topics_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/components/button.dart';
import 'package:ui/components/progress_modal.dart';
import 'package:ui/components/topic_item.dart';

class TopicsScreen extends Screen {
  final NavigationService? _navigationService;
  const TopicsScreen(this._navigationService, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenProvider = ref.read(topicsProvider);
    useEffect(
      () {
        screenProvider.getTopics();
        return null;
      },
      [screenProvider],
    );

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: ref.watch(topicsProvider).topics.length,
            itemBuilder: (BuildContext context, int index) => TopicItem(
              title: ref.watch(topicsProvider).topics[index].name!,
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
        ref.watch(topicsProvider).inAsyncCall
            ? const ProgressModal()
            : const SizedBox()
      ],
    )));
  }
}
