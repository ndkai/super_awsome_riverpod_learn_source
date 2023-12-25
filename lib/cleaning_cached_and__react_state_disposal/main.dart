import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'main.g.dart';
@Riverpod(keepAlive: true)
int example(ExampleRef ref){
  return 1;
}

class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        // On click, destroy the provider.
        ref.invalidate(exampleProvider);
      },
      child: const Text('dispose a provider'),
    );
  }
}

extension CachedForExtention on AutoDisposeRef<Object?>{
  void cachedFor(Duration duration){
    final link = keepAlive();
    final timer = Timer(duration, () =>  link.close());
    onDispose(timer.cancel);
  }
}

@riverpod
Future example2(Example2Ref ref) async{
  ref.cachedFor(const Duration(seconds: 10));
}