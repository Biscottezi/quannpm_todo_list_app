import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manabie_todo_list/View/Widgets/todo_list_tile.dart';
import 'package:manabie_todo_list/ViewModel/todo_viewmodel.dart';

class CompletedTodosPage extends StatelessWidget {
  const CompletedTodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Todos'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final completedTodosList = ref.watch(completedTodosProvider);
          if (completedTodosList.isEmpty) {
            return const Center(
              child: Text('Wow! Such empty.'),
            );
          }
          return ListView.builder(
            itemCount: completedTodosList.length,
            itemBuilder: (context, index) {
              final todo = completedTodosList[index];
              return TodoListTile(todo: todo);
            },
          );
        },
      ),
    );
  }
}