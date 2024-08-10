import 'package:flutter/material.dart';
import 'package:polaroid_count/page/component/singe_project_widget.dart';
import 'package:polaroid_count/page/dialog/add_project_dialog.dart';
import 'package:polaroid_count/page/dialog/del_project_dialog.dart';
import 'package:polaroid_count/page/dialog/edit_project_dialog.dart';
import 'package:provider/provider.dart';

import 'home_page_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => HomePageViewModel()..loadProjects(),
        child: Scaffold(
            appBar: AppBar(title: Text(widget.title)),
            body: Center(child: _buildHomePageProjectList()),
            floatingActionButton: Builder(
              builder: (context) => FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () => _addProject(context)),
            )),
      );

  Widget _buildHomePageProjectList() {
    return Consumer<HomePageViewModel>(builder: (context, model, child) {
      if (model.projects.isEmpty) {
        return const Center(child: Text('没有项目，点击+添加'));
      }
      return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: ListView.builder(
              itemCount: model.projects.length,
              itemBuilder: (context, index) => SingleProjectWidget(
                    project: model.projects[index],
                    onDelete: () => _delProject(context, model.projects[index].id),
                    onClick: () => model.pushProjectInfoPage(context, model.projects[index].title),
                    onEdit: () => _editProject(context, model.projects[index].title, model.projects[index].subtitle),
                  )));
    });
  }

  void _addProject(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext dialogContext) => buildAddProjectDialog(
          context,
          dialogContext,
          TextEditingController(),
          TextEditingController(),
        ),
      );

  void _delProject(BuildContext context, String projectId) => showDialog(
        context: context,
        builder: (BuildContext dialogContext) => buildDelProjectDialog(
          context,
          dialogContext,
          projectId,
        ),
      );

  void _editProject(BuildContext context, String title, String subtitle) =>
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) => buildEditProjectDialog(
          context,
          dialogContext,
          title,
          subtitle,
          TextEditingController(),
          TextEditingController(),
        ),
      );
}
