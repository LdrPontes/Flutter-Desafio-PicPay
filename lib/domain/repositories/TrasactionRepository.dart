import 'package:desafio_picpay/domain/entities/Transaction.dart';

abstract class TransactionRepository{
  Future<Transaction> doTransaction(Transaction transaction);
}