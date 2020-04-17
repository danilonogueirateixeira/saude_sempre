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

  final _$saveUserAsyncAction = AsyncAction('saveUser');

  @override
  Future saveUser(String auth) {
    return _$saveUserAsyncAction.run(() => super.saveUser(auth));
  }

  final _$getUserAsyncAction = AsyncAction('getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

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
  dynamic updateData(String child, String title, String description) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.updateData(child, title, description);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteData(String child) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.deleteData(child);
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
        'currentIndex: ${currentIndex.toString()},uidUser: ${uidUser.toString()},medicamentos: ${medicamentos.toString()}';
    return '{$string}';
  }
}
