class CountData {
  late String _id;
  late String _price;
  late String _eventName;
  late String _color;
  late String _textColor;
  late String _location;
  late String _person;
  late String _ext;

  CountData({
    required String id,
    required String price,
    required String eventName,
    required String color,
    required String textColor,
    required String location,
    required String person,
    required String ext
  }) {
    _id = id;
    _price = price;
    _eventName = eventName;
    _color = color;
    _textColor = textColor;
    _location = location;
    _person = person;
    _ext = ext;
  }

  CountData.fromJson(Map<String, dynamic> json) {
    _id = json['id'].toString();
    _price = json['price'];
    _eventName = json['eventName'] ?? '';
    _color = json['color'] ?? '';
    _textColor = json['textColor'] ?? '';
    _location = json['location'] ?? '';
    _person = json['person'] ?? '';
    _ext = json['ext'] ?? '';
  }

  CountData copyWith({
    String? id,
    String? price,
    String? eventName,
    String? color,
    String? textColor,
    String? location,
    String? person,
    String? ext
  }) =>
      CountData(
        id: id ?? _id,
        price: price ?? _price,
        eventName: eventName ?? _eventName,
        color: color ?? _color,
        textColor: textColor ?? _textColor,
        location: location ?? _location,
        person: person ?? _person,
        ext: ext ?? _ext
      );

  String get id => _id;

  String get price => _price;

  String get eventName => _eventName;

  String get color => _color;

  String get textColor => _textColor;

  String get location => _location;

  String get person => _person;

  String get ext => _ext;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['price'] = _price;
    map['eventName'] = _eventName;
    map['color'] = _color;
    map['textColor'] = _textColor;
    map['location'] = _location;
    map['person'] = _person;
    map['ext'] = _ext;
    return map;
  }
}
