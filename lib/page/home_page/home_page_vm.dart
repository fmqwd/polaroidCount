import 'package:flutter/material.dart';
import 'package:polaroid_count/data/sqlite/project/project_data.dart';
import 'package:polaroid_count/data/sqlite/project/project_db_helper.dart';
import 'package:polaroid_count/page/project_info_page/project_info_page.dart';
import 'package:polaroid_count/utils/route_utils.dart';

class HomePageViewModel extends ChangeNotifier {
  final ProjectDBHelper projectHelper = ProjectDBHelper();
  List<ProjectData> _projects = [];

  List<ProjectData> get projects => _projects;

  Future<void> loadProjects() async {
    _projects = await projectHelper.get();
    notifyListeners();
  }

  Future<void> addProject(String title, String subtitle) async {
    await projectHelper.insert(title, subtitle, "0");
    await loadProjects();
  }

  Future<void> editProject(int id, String title, String subtitle) async {
    await projectHelper.update(id, title, subtitle, "0");
    await loadProjects();
  }

  Future<void> deleteProject(String id) async {
    await projectHelper.delete(id);
    await loadProjects();
  }

  pushProjectInfoPage(BuildContext context, String title) =>
      RouteUtils.pushAnim(context, ProjectInfoPage(title: title));
}
