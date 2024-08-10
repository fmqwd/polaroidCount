import 'package:polaroid_count/data/sqlite/data_base.dart';
import 'package:polaroid_count/data/sqlite/project/project_data.dart';
import 'package:sqflite/sqflite.dart';

class ProjectDBHelper {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> insert(String title, String? subtitle, String count) async {
    final db = await _databaseHelper.database;
    await db.insert(
      'project',
      {
        'title': title,
        'subtitle': subtitle,
        'count': count,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ProjectData>> get() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('project');
    return List.generate(maps.length, (i) => ProjectData.fromJson(maps[i]));
  }


  Future<void> update(int id, String title, String? subtitle, String count) async {
    final db = await _databaseHelper.database;
    await db.update(
      'project',
      {
        'title': title,
        'subtitle': subtitle,
        'count': count,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }


  Future<void> delete(String id) async {
    final db = await _databaseHelper.database;
    await db.delete(
      'project',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
