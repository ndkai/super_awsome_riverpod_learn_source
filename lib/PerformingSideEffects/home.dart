import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supper_awesome_riverpod_learn_source/PerformingSideEffects/provider.dart';

class Home extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();

}

class _HomeState extends ConsumerState<Home>{
  Future<void>? _pendingAddTodo;

  @override
  Widget build(BuildContext context) {
    // this is the function to get current state value
    final data = ref.watch(todoListProvider);
    return FutureBuilder(
      future: _pendingAddTodo,
      builder: (context, snapshot){
        return Row(
          children: [
            ElevatedButton(
              onPressed: () {
                // We keep the future returned by addTodo in a variable
                final future = ref
                    .read(todoListProvider.notifier)
                    .getById("duy");

                // We store that future in the local state
                setState(() {
                  _pendingAddTodo = future;
                });
              },
              child: const Text('Add todo'),
            ),
            // The operation is pending, let's show a progress indicator
            if (snapshot.connectionState == ConnectionState.waiting) ...[
              const SizedBox(width: 8),
              const CircularProgressIndicator(),
            ],
            if (snapshot.connectionState == ConnectionState.done) ...[
              const SizedBox(width: 8),
              Text('${data.value}'),
            ]
          ],
        );
      },
    );
  }
}
