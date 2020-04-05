// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListUsersViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListUsersViewModel on _ListUsersViewModelBase, Store {
  final _$isFocusedAtom = Atom(name: '_ListUsersViewModelBase.isFocused');

  @override
  bool get isFocused {
    _$isFocusedAtom.context.enforceReadPolicy(_$isFocusedAtom);
    _$isFocusedAtom.reportObserved();
    return super.isFocused;
  }

  @override
  set isFocused(bool value) {
    _$isFocusedAtom.context.conditionallyRunInAction(() {
      super.isFocused = value;
      _$isFocusedAtom.reportChanged();
    }, _$isFocusedAtom, name: '${_$isFocusedAtom.name}_set');
  }

  final _$usersAtom = Atom(name: '_ListUsersViewModelBase.users');

  @override
  List<User> get users {
    _$usersAtom.context.enforceReadPolicy(_$usersAtom);
    _$usersAtom.reportObserved();
    return super.users;
  }

  @override
  set users(List<User> value) {
    _$usersAtom.context.conditionallyRunInAction(() {
      super.users = value;
      _$usersAtom.reportChanged();
    }, _$usersAtom, name: '${_$usersAtom.name}_set');
  }

  final _$getUsersAsyncAction = AsyncAction('getUsers');

  @override
  Future getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  final _$_ListUsersViewModelBaseActionController =
      ActionController(name: '_ListUsersViewModelBase');

  @override
  dynamic setFocus(bool focus) {
    final _$actionInfo =
        _$_ListUsersViewModelBaseActionController.startAction();
    try {
      return super.setFocus(focus);
    } finally {
      _$_ListUsersViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String filter) {
    final _$actionInfo =
        _$_ListUsersViewModelBaseActionController.startAction();
    try {
      return super.setFilter(filter);
    } finally {
      _$_ListUsersViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isFocused: ${isFocused.toString()},users: ${users.toString()}';
    return '{$string}';
  }
}
