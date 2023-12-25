import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'provider.g.dart';

@riverpod
class TodoList extends _$TodoList{
  @override
  Future<List<String>> build() async{
    await Future.delayed(const Duration(seconds: 1));
    return [
      "Cooking", "Laundry", "Sweeping"
    ];
  }
  Future<void> addTodo() async{
    await Future.delayed(const Duration(seconds: 1));
    final previousState = await future;
    previousState.add("Cooking1");
    ref.notifyListeners();
  }

  Future<List<String>> getById(String id) async{
    print("getById ${id}");
    return [
      "Cooking", "Laundry", "Sweeping"
    ];
  }


}

