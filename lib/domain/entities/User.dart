class User {
  int _id;
  String _name;
  String _img;
  String _username;

  User({id, name, img, username}) {
    this._id = id;
    this._name = name;
    this._img = img;
    this._username = username;
  }

  
  int get id => _id;

  set id(int value) => _id = value;

  String get name => _name;

  set name(String value) => _name = value;

  String get img => _img;

  set img(String value) => _img = value;

  String get username => _username;

  set username(String value) => _username = value;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "username": username,
      };
}
