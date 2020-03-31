import 'package:desafio_picpay/domain/entities/User.dart';

class TransactionModel {
  int _id;
  int _timestamp;
  double _value;
  User _destinationUser;
  bool _success;
  String _status;

  int get id => _id;

  set id(int value) => _id = value;

  int get timestamp => _timestamp;

  set timestamp(int value) => _timestamp = value;

  double get value => _value;

  set value(double value) => _value = value;

  bool get success => _success;

  set success(bool value) => _success = value;

  String get status => _status;

  set status(String value) => _status = value;

  User get destinationUser => _destinationUser;

  set destinationUser(User value) => _destinationUser = value;
}
