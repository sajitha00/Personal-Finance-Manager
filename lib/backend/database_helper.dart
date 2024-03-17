import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "cashapp.db";
  static const _databaseVersion =
      2; // Increase the version to trigger onUpgrade

  static const table = 'user';
  static const debtsTable = 'debts';
  static const paidTable = 'paid'; // New table name

  static const columnId = '_id';
  static const columnEmail = 'email';
  static const columnPassword = 'password';
  static const columnMobile = 'mobile';
  static const columnAmount = 'amount';
  static const columnDate = 'date';
  static const columnPaid = 'paid'; // New column for paid status

  // Singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Database reference
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
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
    await db.execute('''
          CREATE TABLE $debtsTable (
            $columnId INTEGER PRIMARY KEY,
            $columnAmount REAL NOT NULL,
            $columnDate TEXT NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $paidTable (
            $columnId INTEGER PRIMARY KEY,
            $columnAmount REAL NOT NULL,
            $columnDate TEXT NOT NULL,
            $columnPaid INTEGER NOT NULL DEFAULT 0
          )
          ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Add the new table or alter existing tables here
      await db.execute('''
          CREATE TABLE IF NOT EXISTS $paidTable (
            $columnId INTEGER PRIMARY KEY,
            $columnAmount REAL NOT NULL,
            $columnDate TEXT NOT NULL,
            $columnPaid INTEGER NOT NULL DEFAULT 0
          )
          ''');
    }
  }

  // Insert user
  Future<int?> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db?.insert(table, row);
  }

  // Insert debt
  Future<int?> insertDebt(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db?.insert(debtsTable, row);
  }

  // Insert paid
  Future<int?> insertPaid(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db?.insert(paidTable, row);
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

  // Fetch all debts
  Future<List<Map<String, dynamic>>> fetchAllDebts() async {
    Database? db = await instance.database;
    return await db?.query(debtsTable) ?? [];
  }

  // Fetch all paid
  Future<List<Map<String, dynamic>>> fetchAllPaid() async {
    Database? db = await instance.database;
    return await db?.query(paidTable) ?? [];
  }

  Future<void> deleteDebt(int id) async {
    final db = await instance.database;
    // Use the null-aware operator to safely call delete
    await db?.delete(
      debtsTable,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
