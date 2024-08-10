class ProjectData {
  late String _id;
  late String _title;
  late String _subTitle;
  late String _count;

  ProjectData({
    required String id,
    required String title,
    required String subtitle,
    required String count,
  }) {
    _id = id;
    _title = title;
    _subTitle = subtitle;
    _count = count;
  }

  ProjectData.fromJson(Map<String, dynamic> json) {
    _id = json['id'].toString();
    _title = json['title'] ?? '';
    _subTitle = json['subtitle'] ?? '';
    _count = json['count'] ?? '';
  }

  ProjectData copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? count,
  }) =>
      ProjectData(
        id: id ?? _id,
        title: title ?? _title,
        subtitle: subtitle ?? _subTitle,
        count: count ?? _count,
      );

  String get id => _id;

  String get title => _title;

  String get subtitle => _subTitle;

  String get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['subtitle'] = _subTitle;
    map['count'] = _count;
    return map;
  }
}
