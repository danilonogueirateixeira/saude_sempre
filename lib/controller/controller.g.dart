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

  final _$dadosBaixadosAtom = Atom(name: 'ControllerBase.dadosBaixados');

  @override
  bool get dadosBaixados {
    _$dadosBaixadosAtom.context.enforceReadPolicy(_$dadosBaixadosAtom);
    _$dadosBaixadosAtom.reportObserved();
    return super.dadosBaixados;
  }

  @override
  set dadosBaixados(bool value) {
    _$dadosBaixadosAtom.context.conditionallyRunInAction(() {
      super.dadosBaixados = value;
      _$dadosBaixadosAtom.reportChanged();
    }, _$dadosBaixadosAtom, name: '${_$dadosBaixadosAtom.name}_set');
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

  final _$isDuplicadoInfoAtom = Atom(name: 'ControllerBase.isDuplicadoInfo');

  @override
  bool get isDuplicadoInfo {
    _$isDuplicadoInfoAtom.context.enforceReadPolicy(_$isDuplicadoInfoAtom);
    _$isDuplicadoInfoAtom.reportObserved();
    return super.isDuplicadoInfo;
  }

  @override
  set isDuplicadoInfo(bool value) {
    _$isDuplicadoInfoAtom.context.conditionallyRunInAction(() {
      super.isDuplicadoInfo = value;
      _$isDuplicadoInfoAtom.reportChanged();
    }, _$isDuplicadoInfoAtom, name: '${_$isDuplicadoInfoAtom.name}_set');
  }

  final _$dadosBaixadosInfoAtom =
      Atom(name: 'ControllerBase.dadosBaixadosInfo');

  @override
  bool get dadosBaixadosInfo {
    _$dadosBaixadosInfoAtom.context.enforceReadPolicy(_$dadosBaixadosInfoAtom);
    _$dadosBaixadosInfoAtom.reportObserved();
    return super.dadosBaixadosInfo;
  }

  @override
  set dadosBaixadosInfo(bool value) {
    _$dadosBaixadosInfoAtom.context.conditionallyRunInAction(() {
      super.dadosBaixadosInfo = value;
      _$dadosBaixadosInfoAtom.reportChanged();
    }, _$dadosBaixadosInfoAtom, name: '${_$dadosBaixadosInfoAtom.name}_set');
  }

  final _$informacoesAtom = Atom(name: 'ControllerBase.informacoes');

  @override
  List<Informacoes> get informacoes {
    _$informacoesAtom.context.enforceReadPolicy(_$informacoesAtom);
    _$informacoesAtom.reportObserved();
    return super.informacoes;
  }

  @override
  set informacoes(List<Informacoes> value) {
    _$informacoesAtom.context.conditionallyRunInAction(() {
      super.informacoes = value;
      _$informacoesAtom.reportChanged();
    }, _$informacoesAtom, name: '${_$informacoesAtom.name}_set');
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
  dynamic sendSms(dynamic context) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.sendSms(context);
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
  dynamic createRecordInfo(
      String uidUser, String titulo, String descricao, String data) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.createRecordInfo(uidUser, titulo, descricao, data);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateDataInfo(
      String id, String uidUser, String titulo, String descricao, String data) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.updateDataInfo(id, uidUser, titulo, descricao, data);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteDataInfo(String id) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.deleteDataInfo(id);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getDadosInfo() {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.getDadosInfo();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentIndex: ${currentIndex.toString()},uidUser: ${uidUser.toString()},user: ${user.toString()},contatos: ${contatos.toString()},isDuplicado: ${isDuplicado.toString()},dadosBaixados: ${dadosBaixados.toString()},medicamentos: ${medicamentos.toString()},isDuplicadoInfo: ${isDuplicadoInfo.toString()},dadosBaixadosInfo: ${dadosBaixadosInfo.toString()},informacoes: ${informacoes.toString()}';
    return '{$string}';
  }
}
