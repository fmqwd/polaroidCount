import 'package:flutter/material.dart';
import 'package:polaroid_count/page/home_page/home_page_vm.dart';
import 'package:provider/provider.dart';

Widget buildEditProjectDialog(
    BuildContext context,
    BuildContext dialogContext,
    String title,
    String subtitle,
    TextEditingController titleCon,
    TextEditingController subtitleCon) {
  return AlertDialog(
    title: const Text("编辑项目"),
    content: Column(mainAxisSize: MainAxisSize.min, children: [
      TextField(controller: titleCon, decoration: InputDecoration(hintText: title)),
      TextField(controller: subtitleCon, decoration: InputDecoration(hintText: subtitle)),
    ]),
    actions: [
      TextButton(
          child: const Text("取消"),
          onPressed: () => Navigator.of(dialogContext).pop()),
      TextButton(
          child: const Text("确定"),
          onPressed: () {
            Provider.of<HomePageViewModel>(context, listen: false).addProject(titleCon.text, subtitleCon.text);
            Navigator.of(dialogContext).pop();
          }),
    ],
  );
}
