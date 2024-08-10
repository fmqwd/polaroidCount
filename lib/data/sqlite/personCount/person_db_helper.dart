import 'package:polaroid_count/data/sqlite/data_base.dart';
import 'package:polaroid_count/data/sqlite/personCount/person_data.dart';

class PersonDbHelper {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> insert(
    String name,
    int count,
    String countPre,
    String color,
    String textColor,
  ) async {
    final db = await _databaseHelper.database;
    await db.insert(
      'person_data',
      {
        'name': name,
        'count': count,
        'countPre': countPre,
        'color': color,
        'textColor': textColor,
      },
    );
  }

  Future<List<PersonData>> get() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('person_data');
    return List.generate(maps.length, (i) => PersonData.fromJson(maps[i]));
  }

  Future<void> update(
    String id,
    String name,
    int count,
    String countPre,
    String color,
    String textColor,
  ) async {
    final db = await _databaseHelper.database;
    await db.update(
      'person_data',
      {
        'name': name,
        'count': count,
        'countPre': countPre,
        'color': color,
        'textColor': textColor,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> delete(String id) async {
    final db = await _databaseHelper.database;
    await db.delete(
      'person_data',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
