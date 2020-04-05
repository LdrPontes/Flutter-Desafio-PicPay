import 'dart:convert';

import 'package:desafio_picpay/domain/entities/User.dart';

class UserMapper {
  static jsonToUserList(String listUserJson) {
    List<dynamic> list = json.decode(listUserJson);

    List<User> users = List();

    for (int i = 0; i < list.length; i++) {
      users.add(User.fromJson(list[i]));
    }

    return users;
  }
}
