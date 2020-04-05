import 'package:desafio_picpay/data/mapper/UserMapper.dart';
import 'package:desafio_picpay/data/utils/ApiEndpoints.dart';
import 'package:desafio_picpay/domain/entities/User.dart';
import 'package:desafio_picpay/domain/repositories/UserRepository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl extends UserRepository {
  Dio dio = new Dio();


  @override
  Future<List<User>> listUsers() async{
    Response response = await dio.get(ApiEndpoints.LIST_USERS);
    return UserMapper.jsonToUserList(response.data.toString());
  }
}
