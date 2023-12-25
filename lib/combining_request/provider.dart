import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';


@riverpod
Stream<int> location(LocationRef ref) async*{
  int long = Random().nextInt(100);
  int lat = Random().nextInt(100);
  while(true){
    yield lat * long;
    await Future.delayed(const Duration(seconds: 2));
  }
}

@riverpod
Future<List<String>> hotgirlsNearMe(HotgirlsNearMeRef ref) async{
  final location = ref.watch(locationProvider);
  //get girls from the location and return
  return [
    "Yui",
    "Nano",
    "Mina"
  ];

}