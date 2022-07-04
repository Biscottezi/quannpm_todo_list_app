import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo_list/View/create_todo_page.dart';

void main() {
  group('All todos page test', () {
    testWidgets('All todos page is empty', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: CreateTodoPage(),
          ),
        ),
      );
      expect(find.text('Create Todo'), findsOneWidget);
      expect(find.text('All Todos'), findsNothing);
      expect(find.text('Incompleted Todos'), findsNothing);
      expect(find.text('Completed Todos'), findsNothing);
      expect(find.text('Wow! Such empty.'), findsNothing);
      expect(find.byType(Checkbox), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}