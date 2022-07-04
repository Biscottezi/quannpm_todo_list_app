import 'package:manabie_todo_list/Data/Database/todo_fields.dart';

class Todo {
  int id;
  String task;
  bool isCompleted;

  Todo({
    required this.id,
    required this.task,
    required this.isCompleted,
  });

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map[TodoFields.id],
      task: map[TodoFields.task],
      isCompleted: map[TodoFields.status] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      TodoFields.id: id,
      TodoFields.task: task,
      TodoFields.status: isCompleted ? 1 : 0,
    };
  }
}
