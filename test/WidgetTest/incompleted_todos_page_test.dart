import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo_list/View/incompleted_todos_page.dart';

void main() {
  group('All todos page test', () {
    testWidgets('Incompleted todos page is empty', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: IncompletedTodosPage(),
          ),
        ),
      );
      expect(find.text('Incompleted Todos'), findsOneWidget);
      expect(find.text('All Todos'), findsNothing);
      expect(find.text('Completed Todos'), findsNothing);
      expect(find.text('Wow! Such empty.'), findsOneWidget);
      expect(find.byType(Checkbox), findsNothing);
    });
  });
}