import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'provider.g.dart';
@riverpod
int synchronousExample(SynchronousExampleRef ref){
  return 0;
}
@riverpod
ValueNotifier<int> myListenable(MyListenableRef ref){
   final notifier = ValueNotifier(0);
   ref.onDispose(notifier.dispose);
   notifier.addListener(ref.notifyListeners);
   return notifier;
}

extension on Ref {
  // We can move the previous logic to a Ref extension.
  // This enables reusing the logic between providers
  T disposeAndListenChangeNotifier<T extends ChangeNotifier>(T notifier) {
    onDispose(notifier.dispose);
    notifier.addListener(notifyListeners);
    // We return the notifier to ease the usage a bit
    return notifier;
  }
}
@riverpod
ValueNotifier<int> myListenable2(MyListenable2Ref ref) {
  return ref.disposeAndListenChangeNotifier(ValueNotifier(0));
}

@riverpod
ValueNotifier<int> anotherListenable(AnotherListenableRef ref) {
  return ref.disposeAndListenChangeNotifier(ValueNotifier(42));
}

@riverpod
Stream<int> streamInt(StreamIntRef ref) async*{
  for(var i = 0; i < 30; i++){
    yield i;
    await Future.delayed(const Duration(seconds: 1));
  }
}