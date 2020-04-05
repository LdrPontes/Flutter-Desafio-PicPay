import 'package:desafio_picpay/domain/entities/User.dart';
import 'package:desafio_picpay/domain/repositories/UserRepository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'ListUsersViewModel.g.dart';

class ListUsersViewModel = _ListUsersViewModelBase with _$ListUsersViewModel;

abstract class _ListUsersViewModelBase with Store {
  final repository = GetIt.I<UserRepository>();
  var originalUsers = List<User>();

  @observable
  bool isFocused = false;

  @observable
  List<User> users = List<User>();

  @action
  getUsers() async {
    originalUsers = await repository.listUsers();
    users = originalUsers;
  }

  @action
  setFocus(bool focus) {
    isFocused = focus;
  }

  @action
  setFilter(String filter) {
    List<User> aux = List();
    for (int i = 0; i < originalUsers.length; i++) {
      if (originalUsers[i].name.contains(filter) || originalUsers[i].username.contains(filter))
        aux.add(originalUsers[i]);
    }

    users = aux;
  }
}
