import 'package:desafio_picpay/domain/entities/User.dart';

abstract class UserRepository{
  Future<List<User>> listUsers();
}