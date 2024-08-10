import 'package:polaroid_count/data/sqlite/data_base.dart';
import 'package:polaroid_count/data/sqlite/statistics/statistics_data.dart';
import 'package:sqflite/sqflite.dart';

class CountDBHelper {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> insert(
    String date,
    String? price,
    String? eventName,
    String? color,
    String? textColor,
    String? location,
    String person,
    String? ext,
  ) async {
    final db = await _databaseHelper.database;
    await db.insert(
      'statistics',
      {
        'date': date,
        'price': price,
        'event_name': eventName,
        'location': location,
        'person': person,
        'color': color,
        'textColor': textColor,
        'ext': ext
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CountData>> get() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('statistics');
    return List.generate(maps.length, (i) => CountData.fromJson(maps[i]));
  }

  Future<void> update(
    String id,
    String date,
    String? price,
    String? eventName,
    String? location,
    String person,
    String? color,
    String? textColor,
    String? ext,
  ) async {
    final db = await _databaseHelper.database;
    await db.update(
      'statistics',
      {
        'date': date,
        'price': price,
        'event_name': eventName,
        'location': location,
        'person': person,
        'color': color,
        'textColor': textColor,
        'ext': ext
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> delete(String id) async {
    final db = await _databaseHelper.database;
    await db.delete(
      'statistics',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
