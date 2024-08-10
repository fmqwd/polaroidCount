class UserData {
  late String _userName;
  late String _userKey;
  late String _ext;

  UserData({
    required String userName,
    required String userKey,
    required String ext,
  }) {
    _userName = userName;
    _userKey = userKey;
    _ext = ext;
  }

  UserData.fromJson(Map<String, dynamic> json) {
    _userName = json['user_name'] ?? '';
    _userKey = json['user_key'] ?? '';
    _ext = json['ext'] ?? '';
  }

  UserData copyWith({
    String? userName,
    String? userKey,
    String? ext,
  }) => UserData(
    userName: userName ?? _userName,
    userKey: userKey ?? _userKey,
    ext: ext ?? _ext,
  );

  String get userName => _userName;
  String get userKey => _userKey;
  String get ext => _ext;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_name'] = _userName;
    map['user_key'] = _userKey;
    map['ext'] = _ext;
    return map;
  }
}
