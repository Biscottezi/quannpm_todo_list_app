import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manabie_todo_list/View/Widgets/todo_list_tile.dart';
import 'package:manabie_todo_list/ViewModel/todo_viewmodel.dart';

class IncompletedTodosPage extends StatelessWidget {
  const IncompletedTodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incompleted Todos'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final incompletedTodosList = ref.watch(incompletedTodosProvider);
          if (incompletedTodosList.isEmpty) {
            return const Center(
              child: Text('Wow! Such empty.'),
            );
          }
          return ListView.builder(
            itemCount: incompletedTodosList.length,
            itemBuilder: (context, index) {
              final todo = incompletedTodosList[index];
              return TodoListTile(todo: todo);
            },
          );
        },
      ),
    );
  }
}