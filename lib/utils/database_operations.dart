import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseOperations {
  static final DatabaseOperations _instance = DatabaseOperations._internal();
  factory DatabaseOperations() => _instance;
  DatabaseOperations._internal();

  Future<String> get _databasePath async {
    final databasePath = await getDatabasesPath();
    return join(databasePath, 'cashapp_database.db');
  }

  Future<Database> get _database async {
    return openDatabase(await _databasePath);
  }

  Future<List<Map<String, dynamic>>> getDatabaseData() async {
    final db = await _database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return maps;
  }
}
