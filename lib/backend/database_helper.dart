import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "cashapp.db";
  static const _databaseVersion = 1;

  static const table = 'user';

  static const columnId = '_id';
  static const columnEmail = 'email';
  static const columnPassword = 'password';
  static final columnMobile = 'mobile';

  // Singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Database reference
  static Database? _database = null;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnEmail TEXT NOT NULL,
            $columnPassword TEXT NOT NULL,
            $columnMobile TEXT NOT NULL
          )
          ''');
  }

  // Insert user
  Future<int?> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db?.insert(table, row);
  }

  // Fetch user data
  Future<Map<String, dynamic>> fetchUserData() async {
    Database? db = await instance.database;
    final List<Map<String, Object?>>? maps = await db?.query(table);
    if (maps == null || maps.isEmpty) {
      return {};
    }
    // Convert Object? to dynamic
    return maps.first.map((key, value) => MapEntry(key, value as dynamic));
  }
}
