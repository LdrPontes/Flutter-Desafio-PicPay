import 'package:desafio_picpay/domain/entities/Transaction.dart';
import 'package:desafio_picpay/domain/repositories/TrasactionRepository.dart';
import 'package:desafio_picpay/domain/usecases/UseCase.dart';

class TransactionUseCase extends UseCase<Transaction, TrasactionUseCaseParams> {
  //TODO Alterar para Injeção de Dependência pelo get_it
  TransactionRepository _repository;

  TransactionUseCase(TransactionRepository repository) {
    this._repository = repository;
  }

  @override
  Future<Stream<Transaction>> buildUseCaseStream(TrasactionUseCaseParams params) {
    // TODO: implement buildUseCaseStream
    return null;
  }

}


class TrasactionUseCaseParams{

}
