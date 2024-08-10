import 'package:flutter/material.dart';
import 'package:polaroid_count/page/component/singe_item_widget.dart';
import 'package:polaroid_count/page/project_info_page/project_info_vm.dart';
import 'package:polaroid_count/style/text_style.dart';
import 'package:polaroid_count/utils/ui_utils.dart';
import 'package:provider/provider.dart';

class ProjectInfoPage extends StatefulWidget {
  final String title;

  const ProjectInfoPage({Key? key, required this.title}) : super(key: key);

  @override
  State<ProjectInfoPage> createState() => _ProjectInfoPageState();
}

class _ProjectInfoPageState extends State<ProjectInfoPage> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ProjectInfoViewModel()..loadCounts(),
        child: Scaffold(
            appBar: AppBar(title: Text(widget.title)),
            body: Center(child: _buildProjectInfoContent()),
            floatingActionButton: Builder(
              builder: (context) => FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => {},
              ),
            )),
      );

  Widget _buildProjectInfoContent() => Column(
        children: [
          _buildProjectInfoTitle(),
          Expanded(child: _buildProjectInfoList())
        ],
      );

  Widget _buildProjectInfoTitle() => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        alignment: Alignment.center,
        child: Consumer<ProjectInfoViewModel>(
          builder: (context, model, child) => Text(
              "当前项目总计：${model.counts.length}",
              style: AppTextStyle.heading3),
        ),
      );

  Widget _buildProjectInfoList({int line = 5}) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: Consumer<ProjectInfoViewModel>(builder: (context, model, child) {
        if (model.counts.isEmpty) {
          return const Center(child: Text('没有项目，点击+添加'));
        }
        return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: line,
            ),
            itemCount: model.persons.length,
            itemBuilder: (context, index) => SingleItemWidget(
              width: MediaQuery.of(context).size.width / line,
              countPercent: model.persons[index].countPre,
              countNum: model.persons[index].count,
              name: model.persons[index].name,
              color: parseColor(model.persons[index].color),
              textColor:parseColor(model.persons[index].textColor),
            ),
          ),
        );
      }));
}
