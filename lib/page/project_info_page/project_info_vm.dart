import 'package:flutter/cupertino.dart';
import 'package:polaroid_count/data/sqlite/personCount/person_data.dart';
import 'package:polaroid_count/data/sqlite/personCount/person_db_helper.dart';
import 'package:polaroid_count/data/sqlite/statistics/statistics_data.dart';
import 'package:polaroid_count/data/sqlite/statistics/statistics_db_helper.dart';

class ProjectInfoViewModel extends ChangeNotifier {
  final CountDBHelper countHelper = CountDBHelper();
  final PersonDbHelper personHelper = PersonDbHelper();
  List<CountData> _counts = [];
  List<PersonData> _persons = [];

  List<CountData> get counts => _counts;
  List<PersonData> get persons => _persons;

  Future<void> loadCounts() async {
    _counts = await countHelper.get();
    notifyListeners();
  }

  Future<void> loadPerson() async {
    _persons = await personHelper.get();
    notifyListeners();
  }

  Future<void> addCount(
    String date,
    String? price,
    String? eventName,
    String? location,
    String person,
    String? color,
    String? textColor, {
    String? ext,
  }) async {
    await countHelper.insert(
        date, price, eventName, color, textColor, location, person, ext);
    await loadCounts();
  }

  Future<void> addPerson(
    String name,
    int count,
    String countPre,
    String color,
    String textColor,
  ) async {
    await personHelper.insert(name, count, countPre, color, textColor);
    await loadPerson();
  }

  Future<void> editCount(
    String id,
    String date,
    String? price,
    String? eventName,
    String? location,
    String person,
    String? color,
    String? textColor, {
    String? ext,
  }) async {
    await countHelper.update(id, date, price, eventName, location, person, color, textColor, ext);
    await loadCounts();
  }

  Future<void> editPerson(
      String id,
      String name,
      int count,
      String countPre,
      String color,
      String textColor,
      ) async {
    await personHelper.update(id, name, count, countPre, color, textColor);
    await loadPerson();
  }

  Future<void> deleteCount(String id) async {
    await countHelper.delete(id);
    await loadCounts();
  }

  Future<void> deletePerson(String id) async {
    await personHelper.delete(id);
    await loadPerson();
  }
}
