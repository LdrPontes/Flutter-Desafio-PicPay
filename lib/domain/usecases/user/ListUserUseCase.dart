import 'package:desafio_picpay/domain/entities/User.dart';
import 'package:desafio_picpay/domain/usecases/UseCase.dart';

class ListUserUseCase extends UseCase<List<User>, void> {
  @override
  Stream<List<User>> buildUseCaseStream(void params) async* {
    
  }
}
