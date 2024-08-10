import 'package:flutter/material.dart';
import 'package:polaroid_count/page/home_page/home_page_vm.dart';
import 'package:provider/provider.dart';

Widget buildDelProjectDialog(
  BuildContext context,
  BuildContext dialogContext,
  String projectId,
) =>
    AlertDialog(
      title: const Text("删除项目"),
      content: const Text("确定要删除吗？"),
      actions: [
        TextButton(child: const Text("取消"), onPressed: () => Navigator.of(dialogContext).pop()),
        TextButton(
          child: const Text("确定"),
          onPressed: () {
            Provider.of<HomePageViewModel>(context, listen: false).deleteProject(projectId);
            Navigator.of(dialogContext).pop();
          },
        ),
      ],
    );
