import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manabie_todo_list/View/Widgets/todo_list_tile.dart';
import 'package:manabie_todo_list/ViewModel/todo_viewmodel.dart';

class AllTodosPage extends StatelessWidget {
  const AllTodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Todos'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final allTodosList = ref.watch(allTodosProvider);
          if (allTodosList.isEmpty) {
            return const Center(
              child: Text('Wow! Such empty.'),
            );
          }
          return ListView.builder(
            itemCount: allTodosList.length,
            itemBuilder: (context, index) {
              final todo = allTodosList[index];
              return TodoListTile(todo: todo);
            },
          );
        },
      ),
    );
  }
}
