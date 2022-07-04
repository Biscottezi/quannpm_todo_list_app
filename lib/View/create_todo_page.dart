import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manabie_todo_list/ViewModel/todo_viewmodel.dart';

class CreateTodoPage extends ConsumerStatefulWidget {
  const CreateTodoPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends ConsumerState<CreateTodoPage> {
  var textController = TextEditingController();
  bool isCompleted = false;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            TextField(
              controller: textController,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Enter your task here',
                labelText: 'Task',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: isCompleted,
                  onChanged: (value) =>
                      setState(() => isCompleted = !isCompleted),
                ),
                const SizedBox(width: 20),
                const Text('Completed'),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                try {
                  await ref
                      .read(todoViewModelProvider)
                      .createTodo(textController.text, isCompleted);
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                } catch (e) {
                  Fluttertoast.showToast(
                      msg: 'Create todo failed. Please try again.');
                }
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
