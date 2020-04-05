import 'package:desafio_picpay/app/view/list_users/ListUsersViewModel.dart';
import 'package:desafio_picpay/data/repositories/UserRepositoryImpl.dart';
import 'package:desafio_picpay/domain/repositories/UserRepository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void startModules() {
  _startRepositories();
  _startViewModels();
}

void _startRepositories() {
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
}

void _startViewModels() {
  getIt.registerSingleton<ListUsersViewModel>(ListUsersViewModel());
}
