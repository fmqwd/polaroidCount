import 'package:polaroid_count/data/sqlite/data_base.dart';
import 'package:sqflite/sqflite.dart';

class UserDBHelper {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> insert(String username, String userKey, String ext) async {
    final db = await _databaseHelper.database;
    await db.insert(
      'users',
      {
        'username': username,
        'user_key': userKey,
        'ext': ext,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> get() async {
    final db = await _databaseHelper.database;
    return await db.query('users');
  }

  Future<void> update(
      int id, String username, String userKey, String ext) async {
    final db = await _databaseHelper.database;
    await db.update(
      'users',
      {
        'username': username,
        'user_key': userKey,
        'ext': ext,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> delete(int id) async {
    final db = await _databaseHelper.database;
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
