// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on ControllerBase, Store {
  final _$currentIndexAtom = Atom(name: 'ControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.context.enforceReadPolicy(_$currentIndexAtom);
    _$currentIndexAtom.reportObserved();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.context.conditionallyRunInAction(() {
      super.currentIndex = value;
      _$currentIndexAtom.reportChanged();
    }, _$currentIndexAtom, name: '${_$currentIndexAtom.name}_set');
  }

  final _$uidUserAtom = Atom(name: 'ControllerBase.uidUser');

  @override
  String get uidUser {
    _$uidUserAtom.context.enforceReadPolicy(_$uidUserAtom);
    _$uidUserAtom.reportObserved();
    return super.uidUser;
  }

  @override
  set uidUser(String value) {
    _$uidUserAtom.context.conditionallyRunInAction(() {
      super.uidUser = value;
      _$uidUserAtom.reportChanged();
    }, _$uidUserAtom, name: '${_$uidUserAtom.name}_set');
  }

  final _$userAtom = Atom(name: 'ControllerBase.user');

  @override
  User get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$isDuplicadoAtom = Atom(name: 'ControllerBase.isDuplicado');

  @override
  bool get isDuplicado {
    _$isDuplicadoAtom.context.enforceReadPolicy(_$isDuplicadoAtom);
    _$isDuplicadoAtom.reportObserved();
    return super.isDuplicado;
  }

  @override
  set isDuplicado(bool value) {
    _$isDuplicadoAtom.context.conditionallyRunInAction(() {
      super.isDuplicado = value;
      _$isDuplicadoAtom.reportChanged();
    }, _$isDuplicadoAtom, name: '${_$isDuplicadoAtom.name}_set');
  }

  final _$medicamentosAtom = Atom(name: 'ControllerBase.medicamentos');

  @override
  List<Medicamento> get medicamentos {
    _$medicamentosAtom.context.enforceReadPolicy(_$medicamentosAtom);
    _$medicamentosAtom.reportObserved();
    return super.medicamentos;
  }

  @override
  set medicamentos(List<Medicamento> value) {
    _$medicamentosAtom.context.conditionallyRunInAction(() {
      super.medicamentos = value;
      _$medicamentosAtom.reportChanged();
    }, _$medicamentosAtom, name: '${_$medicamentosAtom.name}_set');
  }

  final _$contatosAtom = Atom(name: 'ControllerBase.contatos');

  @override
  List<Contato> get contatos {
    _$contatosAtom.context.enforceReadPolicy(_$contatosAtom);
    _$contatosAtom.reportObserved();
    return super.contatos;
  }

  @override
  set contatos(List<Contato> value) {
    _$contatosAtom.context.conditionallyRunInAction(() {
      super.contatos = value;
      _$contatosAtom.reportChanged();
    }, _$contatosAtom, name: '${_$contatosAtom.name}_set');
  }

  final _$saveContatosAsyncAction = AsyncAction('saveContatos');

  @override
  Future saveContatos(Contato contato) {
    return _$saveContatosAsyncAction.run(() => super.saveContatos(contato));
  }

  final _$getContatosAsyncAction = AsyncAction('getContatos');

  @override
  Future getContatos() {
    return _$getContatosAsyncAction.run(() => super.getContatos());
  }

  final _$deleteContatoAsyncAction = AsyncAction('deleteContato');

  @override
  Future deleteContato(dynamic index) {
    return _$deleteContatoAsyncAction.run(() => super.deleteContato(index));
  }

  final _$deleteContatosAsyncAction = AsyncAction('deleteContatos');

  @override
  Future deleteContatos() {
    return _$deleteContatosAsyncAction.run(() => super.deleteContatos());
  }

  final _$saveUserAsyncAction = AsyncAction('saveUser');

  @override
  Future saveUser(User user) {
    return _$saveUserAsyncAction.run(() => super.saveUser(user));
  }

  final _$deleteUserAsyncAction = AsyncAction('deleteUser');

  @override
  Future deleteUser() {
    return _$deleteUserAsyncAction.run(() => super.deleteUser());
  }

  final _$getUserAsyncAction = AsyncAction('getUser');

  @override
  Future<User> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic sendSms(List<Contato> contatos, String mensagem, dynamic context) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.sendSms(contatos, mensagem, context);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onTabTapped(int index) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.onTabTapped(index);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic createRecord(
      String uidUser, String name, String frequency, String description) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.createRecord(uidUser, name, frequency, description);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateData(String id, String uidUser, String name, String frequency,
      String description) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.updateData(id, uidUser, name, frequency, description);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteData(String id) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.deleteData(id);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getDados() {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.getDados();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentIndex: ${currentIndex.toString()},uidUser: ${uidUser.toString()},user: ${user.toString()},isDuplicado: ${isDuplicado.toString()},medicamentos: ${medicamentos.toString()},contatos: ${contatos.toString()}';
    return '{$string}';
  }
}
