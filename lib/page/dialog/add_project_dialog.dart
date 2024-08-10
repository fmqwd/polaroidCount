import 'package:flutter/material.dart';
import 'package:polaroid_count/page/home_page/home_page_vm.dart';
import 'package:provider/provider.dart';

Widget buildAddProjectDialog(
  BuildContext context,
  BuildContext dialogContext,
  TextEditingController titleCon,
  TextEditingController subtitleCon,
) =>
    AlertDialog(
      title: const Text("新增项目"),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(
            controller: titleCon,
            decoration: const InputDecoration(labelText: "请输入标题（必填）")),
        TextField(
            controller: subtitleCon,
            decoration: const InputDecoration(labelText: "请输入描述（可选）")),
      ]),
      actions: [
        TextButton(
            child: const Text("取消"),
            onPressed: () => Navigator.of(dialogContext).pop()),
        TextButton(
          child: const Text("确定"),
          onPressed: () {
            Provider.of<HomePageViewModel>(context, listen: false)
                .addProject(titleCon.text, subtitleCon.text);
            Navigator.of(dialogContext).pop();
          },
        ),
      ],
    );
