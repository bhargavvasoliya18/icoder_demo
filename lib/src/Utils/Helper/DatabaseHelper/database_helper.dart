import 'package:bhargav_practicle/src/Model/TransactionModel/transaction_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static String transactionTableName = "transactions";
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'transaction.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $transactionTableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        transaction_type INTEGER,
        description TEXT,
        transaction_date TEXT,
        transaction_amount REAL,
        open_balance REAL,
        closing_balance REAL,
        created_at TEXT
      )
    ''');
  }

  Future<int> addTransaction(TransactionModel transaction) async {
    Database db = await database;
    return await db.insert(transactionTableName, transaction.toMap());
  }

  Future<int> updateTransaction(TransactionModel transaction) async {
    Database db = await database;
    return await db.update(
      transactionTableName,
      transaction.toMap(),
      where: 'id = ?',
      whereArgs: [transaction.id],
    );
  }

  Future<int> deleteTransaction(int id) async {
    Database db = await database;
    return await db.delete(
      transactionTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Database> getDatabase() async {
    return await openDatabase(
      '$transactionTableName.db',
      version: 1,
      onCreate: (db, version) {
        // Table creation code here
      },
    );
  }

  Future<void> clearTable() async {
    final db = await getDatabase();
    await db.execute('DELETE FROM $transactionTableName;');
    print('Table cleared');
  }

  Future<List<TransactionModel>> getTransactions() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(transactionTableName);

    return List.generate(maps.length, (i) {
      return TransactionModel.fromMap(maps[i]);
    });
  }
}