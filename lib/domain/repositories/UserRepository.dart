import 'package:desafio_picpay/domain/entities/User.dart';

abstract class UserRespository{
  Future<List<User>> listUsers();
}