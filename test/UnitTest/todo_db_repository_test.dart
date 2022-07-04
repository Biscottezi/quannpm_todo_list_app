import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo_list/Data/Database/todo_database.dart';
import 'package:manabie_todo_list/Data/Database/todo_db_repository.dart';
import 'package:manabie_todo_list/Data/Database/todo_fields.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  //runApp(const ProviderScope(child: MyApp()));
  group('Test TodoDBRepository class', () {
    test('TodoDBRepository should get 1 todo', () async {
      var repo = TodoDBRepository();

      await TodoDatabase.instance.createTodo({
        TodoFields.task: 'Buy Milk',
        TodoFields.status: 1,
      });

      var todoList = await repo.getAllTodos();

      expect(todoList.length, 1);
    });

    test('TodoDBRepository create todo successfully', () async {
      var repo = TodoDBRepository();

      await repo.createTodo('Clean the house', false);

      var todoList = await repo.getAllTodos();
      var latestTodo = todoList.last;

      expect(latestTodo.task, 'Clean the house');
      expect(latestTodo.isCompleted, false);
    });

    test('TodoDBRepository update todo successfully', () async {
      var repo = TodoDBRepository();

      var todoList = await repo.getAllTodos();
      var latestTodo = todoList.last;
      latestTodo.isCompleted = true;

      await repo.updateTodo(latestTodo);
      todoList = await repo.getAllTodos();
      latestTodo = todoList.last;

      expect(latestTodo.task, 'Clean the house');
      expect(latestTodo.isCompleted, true);
    });
  });  
}