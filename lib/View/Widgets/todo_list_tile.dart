import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manabie_todo_list/Model/todo.dart';
import 'package:manabie_todo_list/ViewModel/todo_viewmodel.dart';

class TodoListTile extends ConsumerWidget {
  final Todo todo;

  const TodoListTile({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(todo.task),
      trailing: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) async {
          todo.isCompleted = !todo.isCompleted;
          try {
            await ref
              .read(todoViewModelProvider)
              .updateTodoStatus(todo);
          }
          catch(e) {
            Fluttertoast.showToast(msg: 'Update todo failed. Please try again.');
          }
        },
      ),
    );
  }
}
