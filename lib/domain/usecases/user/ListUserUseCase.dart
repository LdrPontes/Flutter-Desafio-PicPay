import 'package:desafio_picpay/domain/entities/User.dart';
import 'package:desafio_picpay/domain/repositories/UserRepository.dart';
import 'package:desafio_picpay/domain/usecases/UseCase.dart';
import 'package:get_it/get_it.dart';

class ListUserUseCase extends UseCase<List<User>, void> {

  final repository = GetIt.I<UserRepository>();
  

  @override
  Future<Stream<List<User>>> buildUseCaseStream(void params) {
    
    return null;
  }

}
