import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo_list/View/all_todos_page.dart';

void main() {
  group('All todos page test', () {
    testWidgets('All todos page is empty', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: AllTodosPage(),
          ),
        ),
      );
      expect(find.text('All Todos'), findsOneWidget);
      expect(find.text('Incompleted Todos'), findsNothing);
      expect(find.text('Completed Todos'), findsNothing);
      expect(find.text('Wow! Such empty.'), findsOneWidget);
      expect(find.byType(Checkbox), findsNothing);
    });
  });
}
