import 'package:desafio_picpay/data/models/TransactionModel.dart';
import 'package:desafio_picpay/domain/entities/Transaction.dart';
import 'package:desafio_picpay/domain/repositories/TrasactionRepository.dart';
import 'package:desafio_picpay/domain/usecases/UseCase.dart';

class TransactionUseCase extends UseCase<TransactionModel, Transaction> {
  //TODO Alterar para Injeção de Dependência pelo get_it
  TransactionRepository _repository;

  TransactionUseCase(TransactionRepository repository) {
    this._repository = repository;
  }

  @override
  Stream<TransactionModel> buildUseCaseStream(Transaction params) async* {
    yield await _repository.doTransaction(params);
  }
}
