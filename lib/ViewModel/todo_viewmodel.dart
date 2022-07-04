import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manabie_todo_list/Data/DAO/todo_dao.dart';
import 'package:manabie_todo_list/Data/Database/todo_db_repository.dart';
import 'package:manabie_todo_list/Data/Repository/todo_repository.dart';
import 'package:manabie_todo_list/Model/todo.dart';

final todoViewModelProvider = ChangeNotifierProvider((ref) => TodoViewModel());

final allTodosProvider = StateProvider<List<Todo>>((ref) {
  final todoViewModel = ref.watch(todoViewModelProvider);
  debugPrint('All todos: ${todoViewModel.todoList.length}');
  return todoViewModel.todoList;
});

final completedTodosProvider = StateProvider<List<Todo>>((ref) {
  final allTodos = ref.watch(allTodosProvider);
  final completedTodos =
      allTodos.where((todo) => todo.isCompleted == true).toList();
  debugPrint('Completed todos: ${completedTodos.length}');
  return completedTodos;
});

final incompletedTodosProvider = StateProvider<List<Todo>>((ref) {
  final allTodos = ref.watch(allTodosProvider);
  final incompletedTodos =
      allTodos.where((todo) => todo.isCompleted == false).toList();
  debugPrint('Incompleted todos: ${incompletedTodos.length}');
  return incompletedTodos;
});

class TodoViewModel extends ChangeNotifier {
  List<Todo> todoList = [];
  TodoRepository todoRepo = TodoDBRepository();

  TodoViewModel() {
    getAllTodos();
  }

  void getAllTodos() async {
    try {
      todoList = await todoRepo.getAllTodos();
      notifyListeners();
    } catch (e) {
      debugPrint('Error when fetching todos');
    }
  }

  Future<void> createTodo(String task, bool status) async {
    try {
      await todoRepo.createTodo(task, status);
      getAllTodos();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTodoStatus(Todo todo) async {
    try {
      await todoRepo.updateTodo(todo);
      getAllTodos();
    } catch (e) {
      rethrow;
    }
  }
}
