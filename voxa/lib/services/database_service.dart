import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:voxa/models/item.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;

  DatabaseService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'voxa.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE items(id TEXT PRIMARY KEY, name TEXT, quantity INTEGER, dateAdded TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> updateItem(Item item) async {
    final db = await database;
    await db.update(
      'items',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<void> deleteItem(String id) async {
    final db = await database;
    await db.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}