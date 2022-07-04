import 'package:manabie_todo_list/Data/Repository/todo_repository.dart';
import 'package:manabie_todo_list/Model/todo.dart';

class TodoDAO implements TodoRepository{
  List<Todo> todoList = [
    Todo(
      id: 1,
      task: 'Buy Milk',
      isCompleted: true,
    ),
    Todo(
      id: 2,
      task: 'Buy Eggs',
      isCompleted: false,
    ),
    Todo(
      id: 3,
      task: 'Wash clothes',
      isCompleted: true,
    ),
    Todo(
      id: 4,
      task: 'Clean the house',
      isCompleted: false,
    ),
  ];

  @override
  Future<List<Todo>> getAllTodos() async {
    return todoList;
  }

  @override
  Future<void> createTodo(String task, bool status) async {
    final latestTodo = todoList.last;
    final newTodo = Todo(
      id: latestTodo.id + 1,
      task: task,
      isCompleted: status,
    );
    todoList.add(newTodo);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final updatedTodo = todoList.firstWhere((e) => e.id == todo.id);
    updatedTodo.isCompleted = todo.isCompleted;
  }
}
