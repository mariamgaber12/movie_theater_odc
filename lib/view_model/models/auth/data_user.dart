class UserData {
  String? _accessToken;
  User? data;

  UserData({String? accessToken, User? user}) {
    if (accessToken != null) {
      this._accessToken = accessToken;
    }
    if (user != null) {
      this.data = user;
    }
  }

  String? get accessToken => _accessToken;
  set accessToken(String? accessToken) => _accessToken = accessToken;
  User? get user => data;
  set user(User? user) => data = user;

  UserData.fromJson(Map<String, dynamic> json) {
    _accessToken = json['accessToken'];
    data = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this._accessToken;
    if (this.data != null) {
      data['user'] = this.data!.toJson();
    }
    return data;
  }
}

class User {
  int? _id;
  String? _name;
  String? _email;

  User({int? id, String? name, String? email}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    return data;
  }
}
