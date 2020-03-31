import 'package:desafio_picpay/domain/entities/Card.dart';

class Transaction {
  Card _card;
  double _value;
  int _destinationUserId;

  double get value => _value;

  set value(double value) => _value = value;

  int get destinationUserId => _destinationUserId;

  set destinationUserId(int value) => _destinationUserId = value;
}
