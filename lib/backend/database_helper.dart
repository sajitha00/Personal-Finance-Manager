import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';

class DatabaseHelper {
  static const _databaseName = "cashapp.db";
  static const _databaseVersion = 2;

  static const table = 'user';
  static const debtsTable = 'debts';
  static const paidTable = 'paid';

  static const columnId = '_id';
  static const columnEmail = 'email';
  static const columnPassword = 'password';
  static const columnMobile = 'mobile';
  static const columnAmount = 'amount';
  static const columnDate = 'date';
  static const columnPaid = 'paid';

  //add details

  static const tableWeeklyBudget = 'weeklyBudgetTable';
  static const columnBudgetId = 'budget id';
  static const columnWeekRange = 'weekRange';
  static const columnBudget = 'budget';

  static const tableWeeklyIncome = 'dailyIncome';
  static const columnIncDate = 'date';
  static const columnIncome = 'income';

  static const tableWeeklyExpense = 'dailyExpense';
  static const columnExpDate = 'date';
  static const columnExpense = 'expense';


  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory directory = await getApplicationCacheDirectory();
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

    //add details

    await db.execute('''
          CREATE TABLE $tableWeeklyBudget (
            $columnBudgetId INTEGER PRIMARY KEY,
            $columnWeekRange TEXT NOT NULL,
            $columnBudget REAL NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $tableWeeklyIncome (
            $columnId INTEGER PRIMARY KEY,
            $columnDate TEXT DEFAULT (DATE('now')),
            $columnIncome REAL NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $tableWeeklyExpense (
            $columnId INTEGER PRIMARY KEY,
            $columnDate TEXT DEFAULT (DATE('now')),
            $columnExpense REAL NOT NULL
          )
          ''');

  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
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

  Future<int?> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db?.insert(table, row);
  }

  Future<int?> insertDebt(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db?.insert(debtsTable, row);
  }

  Future<int?> insertPaid(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    final id = row[columnId];
    final existingPaid =
        await db?.query(paidTable, where: '$columnId = ?', whereArgs: [id]);
    if (existingPaid != null && existingPaid.isNotEmpty) {
      // Update existing record
      return await db
          ?.update(paidTable, row, where: '$columnId = ?', whereArgs: [id]);
    } else {
      // Insert new record
      return await db?.insert(paidTable, row);
    }
  }

  Future<Map<String, dynamic>> fetchUserData() async {
    Database? db = await instance.database;
    final List<Map<String, Object?>>? maps = await db?.query(table);
    if (maps == null || maps.isEmpty) {
      return {};
    }
    return maps.first.map((key, value) => MapEntry(key, value as dynamic));
  }

  Future<List<Map<String, dynamic>>> fetchAllDebts() async {
    Database? db = await instance.database;
    return await db?.query(debtsTable) ?? [];
  }

  Future<List<Map<String, dynamic>>> fetchAllPaid() async {
    Database? db = await instance.database;
    return await db?.query(paidTable) ?? [];
  }

  Future<void> deleteDebt(int id) async {
    final db = await instance.database;
    await db?.delete(debtsTable, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int?> countDebtsRecords() async {
    final db = await database;
    if (db != null) {
      final List<Map<String, dynamic>> maps =
          await db.rawQuery('SELECT COUNT(*) as count FROM $debtsTable');
      return Sqflite.firstIntValue(maps);
    } else {
      throw Exception('Database is not initialized');
    }
  }

  Future<int?> countPaidRecords() async {
    final db = await database;
    if (db != null) {
      final List<Map<String, dynamic>> maps =
          await db.rawQuery('SELECT COUNT(*) as count FROM $paidTable');
      return Sqflite.firstIntValue(maps);
    } else {
      throw Exception('Database is not initialized');
    }
  }

  //add details

  //fetch
  // Future<List<Map<String, dynamic>>> fetchBudget() async {
  //   Database database = await this.database;
  // }
  // Future<List<Map<String, dynamic>>> fetchBudget() async {
  //   Database? db = await instance.database;
  //   return await db?.query(debtsTable) ?? [];
  // }

  Future<int> fetchWeeklyBudget() async {
    final db = await instance.database;
    final List<Map<String, dynamic>>? maps = await db?.rawQuery('''
    SELECT $columnBudget
    FROM $tableWeeklyBudget
    WHERE $columnWeekRange = ?
 ''', [DateTime.now().toIso8601String()]);
    if (maps != null && maps.isNotEmpty) {
      return maps.first['budget'];
    } else {
      return 0; // or any other default value
    }
  }

  Future<int> fetchTotalIncomeForWeek() async {
    final db = await instance.database;
    final List<Map<String, dynamic>>? maps = await db?.rawQuery('''
    SELECT $columnIncome
    FROM $tableWeeklyIncome
    WHERE $columnWeekRange = ?
 ''', [DateTime.now().toIso8601String()]);
    if (maps != null && maps.isNotEmpty) {
      return maps.first['income'];
    } else {
      return 0; // or any other default value
    }
  }

    Future<int> fetchTotalExpenseForWeek() async {
      final db = await instance.database;
      final List<Map<double, dynamic>>? maps = (await db?.rawQuery('''
    SELECT $columnExpense
    FROM $tableWeeklyExpense
    WHERE $columnWeekRange = ?
 ''', [DateTime.now().toIso8601String()]))?.cast<Map<double, dynamic>>();
      if (maps != null && maps.isNotEmpty) {
        return maps.first['expense'];
      } else {
        return 0; // or any other default value
      }
    }

}
