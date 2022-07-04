import 'package:manabie_todo_list/Data/Database/todo_database.dart';
import 'package:manabie_todo_list/Data/Database/todo_fields.dart';
import 'package:manabie_todo_list/Data/Repository/todo_repository.dart';
import 'package:manabie_todo_list/Model/todo.dart';

class TodoDBRepository implements TodoRepository {
  @override
  Future<void> createTodo(String task, bool status) async {
    try {
      final todoData = {
        TodoFields.task: task,
        TodoFields.status: status ? 1 : 0,
      };
      await TodoDatabase.instance.createTodo(todoData);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Todo>> getAllTodos() async {
    try {
      final result = await TodoDatabase.instance.getAllTodos();
      final todoList = result.map((item) => Todo.fromMap(item)).toList();
      return todoList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    try {
      await TodoDatabase.instance.updateTodo(todo.toMap());
    } catch (e) {
      rethrow;
    }
  }
}
