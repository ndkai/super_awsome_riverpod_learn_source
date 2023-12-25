import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supper_awesome_riverpod_learn_source/first_network_request/provider.dart';

import 'models/activity.dart';

class Home extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();

}

class _HomeState extends ConsumerState<Home>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.listenManual(activityProvider, (previous, next) { });
  }
  @override
  Widget build(BuildContext context) {
    final AsyncValue<Activity> activity = ref.watch(activityProvider);
    return Center(

      child: switch (activity) {
        AsyncData(:final value) => Text('Activity: ${value.activity}'),
        AsyncError() => const Text('Oops, something unexpected happened'),
        _ => const CircularProgressIndicator(),
      },
    );
  }

}