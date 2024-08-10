class PersonData {
  late String _id;
  late String _name;
  late int _count;
  late String _countPre;
  late String _color;
  late String _textColor;

  PersonData({
    required String id,
    required String name,
    required int count,
    required String countPre,
    required String color,
    required String textColor,
  }) {
    _id = id;
    _name = name;
    _count = count;
    _countPre = countPre;
    _color = color;
    _textColor = textColor;
  }

  PersonData.fromJson(Map<String, dynamic> json) {
    _id = json['id'].toString();
    _name = json['name'];
    _count = json['count'];
    _countPre = json['countPre'];
    _color = json['color'];
    _textColor = json['textColor'];
  }

  PersonData copyWith({
    String? name,
    int? count,
    String? countPre,
  }) {
    return PersonData(
      id: _id,
      name: name ?? _name,
      count: count ?? _count,
      countPre: countPre ?? _countPre,
      color: _color,
      textColor: _textColor,
    );
  }

  String get id => _id;

  String get name => _name;

  int get count => _count;

  String get countPre => _countPre;

  String get color => _color;

  String get textColor => _textColor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['count'] = _count;
    map['countPre'] = _countPre;
    map['color'] = _color;
    map['textColor'] = _textColor;
    return map;
  }
}
