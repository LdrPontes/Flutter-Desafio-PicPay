import 'package:desafio_picpay/data/models/TransactionModel.dart';
import 'package:desafio_picpay/domain/entities/Transaction.dart';

abstract class TransactionRepository{
  Future<TransactionModel> doTransaction(Transaction transaction);
}