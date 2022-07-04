import 'package:manabie_todo_list/Data/Database/todo_fields.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TodoDatabase {
  static final TodoDatabase instance = TodoDatabase._init();

  static Database? _database;

  TodoDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB(TodoFields.dbName);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${TodoFields.tableName} ( 
        ${TodoFields.id} INTEGER PRIMARY KEY AUTOINCREMENT, 
        ${TodoFields.task} TEXT NOT NULL,
        ${TodoFields.status} INTEGER NOT NULL
      )
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<List<Map<String, dynamic>>> getAllTodos() async {
    final db = await instance.database;
    final result = await db.query(TodoFields.tableName);
    return result;
  }

  Future<void> createTodo(Map<String, dynamic> data) async {
    final db = await instance.database;
    await db.insert(TodoFields.tableName, data);
  }

  Future<void> updateTodo(Map<String, dynamic> data) async {
    final db = await instance.database;
    await db.update(
      TodoFields.tableName,
      data,
      where: '${TodoFields.id} == ?',
      whereArgs: [data[TodoFields.id]],
    );
  }
}
