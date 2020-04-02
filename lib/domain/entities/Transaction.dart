import 'package:desafio_picpay/domain/entities/User.dart';

class Transaction {
  int id;
  User destinationUser;
  bool sucess;
  String status;
  double value;
  int timestamp;

  int get getId => id;

  set setId(int id) => this.id = id;

  bool get getSucess => sucess;

  set setSucess(bool sucess) => this.sucess = sucess;

  String get getStatus => status;

  set setStatus(String status) => this.status = status;

  double get getValue => value;

  set setValue(double value) => this.value = value;

  int get getTimestamp => timestamp;

  set setTimestamp(int timestamp) => this.timestamp = timestamp;
}
