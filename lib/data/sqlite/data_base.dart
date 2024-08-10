import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'user_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute("""
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL UNIQUE,
        user_key TEXT NOT NULL,
        ext TEXT
      )
    """);
    await db.execute("""
      CREATE TABLE statistics (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        price TEXT,
        event_name TEXT,
        location TEXT,
        color TEXT,
        textColor TEXT,
        person TEXT NOT NULL,
        ext TEXT
      )
    """);
    await db.execute("""
      CREATE TABLE project (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        subtitle TEXT,
        count TEXT
      )
    """);
    await db.execute("""
      CREATE TABLE person_data (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        count TEXT NOT NULL,
        countPre TEXT NOT NULL,
        color TEXT NOT NULL,
        textColor TEXT NOT NULL
      )
    """);
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}