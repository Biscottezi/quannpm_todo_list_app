import 'package:flutter/material.dart';
import 'package:manabie_todo_list/View/all_todos_page.dart';
import 'package:manabie_todo_list/View/completed_todos_page.dart';
import 'package:manabie_todo_list/View/create_todo_page.dart';
import 'package:manabie_todo_list/View/incompleted_todos_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int currentPage = 0;
  List<Widget> pages = [
    const AllTodosPage(),
    const CompletedTodosPage(),
    const IncompletedTodosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const CreateTodoPage(),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) => setState(() => currentPage = index),
        items: const [
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: 'Incompleted',
          ),
        ],
      ),
    );
  }
}
