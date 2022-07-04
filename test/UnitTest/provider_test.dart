import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo_list/ViewModel/todo_viewmodel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Test 3 providers: All, Completed, Incompleted Todos', () {
    test('AllTodos, CompletedTodos, IncompletedTodos lists have no element',
        () async {
      //Provider container object is used to read providers
      final container = ProviderContainer();
      addTearDown(container.dispose);

      //Expect allTodoList to have no element
      final allTodosList = container.read(allTodosProvider);
      expect(allTodosList.length, 0);

      //Expect completedTodoList to have no element
      final completedTodosList = container.read(completedTodosProvider);
      expect(completedTodosList.length, 0);

      //Expect incompletedTodoList to have no element
      final incompletedTodosList = container.read(incompletedTodosProvider);
      expect(incompletedTodosList.length, 0);
    });

    test('There is only one completed todo after creating todo', () async {
      //Provider container object is used to read providers
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final todoViewModel = container.read(todoViewModelProvider);
      await todoViewModel.createTodo('Buy Milk', true);

      await container.pump();

      //Expect allTodoList to have one element
      final allTodosList = container.read(allTodosProvider);
      expect(allTodosList.length, 1);

      //Expect completedTodoList to have one element
      final completedTodosList = container.read(completedTodosProvider);
      expect(completedTodosList.length, 1);

      //Expect incompletedTodoList to have no element
      final incompletedTodosList = container.read(incompletedTodosProvider);
      expect(incompletedTodosList.length, 0);
    });

    test('There are 1 completed todo and 1 incompleted todo after creating todo', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final todoViewModel = container.read(todoViewModelProvider);
      await todoViewModel.createTodo('Clean the house', false);

      await container.pump();

      //There are already one completed todo: "Buy Milk" in the database
      //Expect allTodoList to have two element
      final allTodosList = container.read(allTodosProvider);
      expect(allTodosList.length, 1);

      //Expect completedTodoList to have one element
      final completedTodosList = container.read(completedTodosProvider);
      expect(completedTodosList.length, 1);

      //Expect incompletedTodoList to have one element
      final incompletedTodosList = container.read(incompletedTodosProvider);
      expect(incompletedTodosList.length, 1);
    });
  });
}
