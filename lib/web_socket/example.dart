import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supper_awesome_riverpod_learn_source/web_socket/provider.dart';

class StreamExample extends ConsumerWidget {
  const StreamExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<int> value = ref.watch(streamIntProvider);
    return Scaffold(
      body: Center(
        child: switch (value) {
          AsyncValue(:final error?) => const Text("error"),
          AsyncValue(:final value?) => Text("${value}"),
          _ => const CircularProgressIndicator()
        },
      )
    );
  }
}
