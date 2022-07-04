import 'package:manabie_todo_list/Model/todo.dart';

abstract class TodoRepository {

  Future<List<Todo>> getAllTodos();

  Future<void> createTodo(String task, bool status);

  Future<void> updateTodo(Todo todo);

}