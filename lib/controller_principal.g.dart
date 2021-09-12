// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_principal.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerPrincipal on ControllerPrincipalBase, Store {
  final _$novoItemAtom = Atom(name: 'ControllerPrincipalBase.novoItem');

  @override
  String get novoItem {
    _$novoItemAtom.reportRead();
    return super.novoItem;
  }

  @override
  set novoItem(String value) {
    _$novoItemAtom.reportWrite(value, super.novoItem, () {
      super.novoItem = value;
    });
  }

  final _$listaItensAtom = Atom(name: 'ControllerPrincipalBase.listaItens');

  @override
  ObservableList<ControllerItem> get listaItens {
    _$listaItensAtom.reportRead();
    return super.listaItens;
  }

  @override
  set listaItens(ObservableList<ControllerItem> value) {
    _$listaItensAtom.reportWrite(value, super.listaItens, () {
      super.listaItens = value;
    });
  }

  final _$ControllerPrincipalBaseActionController =
      ActionController(name: 'ControllerPrincipalBase');

  @override
  void setNovoItem(String valor) {
    final _$actionInfo = _$ControllerPrincipalBaseActionController.startAction(
        name: 'ControllerPrincipalBase.setNovoItem');
    try {
      return super.setNovoItem(valor);
    } finally {
      _$ControllerPrincipalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionarItem() {
    final _$actionInfo = _$ControllerPrincipalBaseActionController.startAction(
        name: 'ControllerPrincipalBase.adicionarItem');
    try {
      return super.adicionarItem();
    } finally {
      _$ControllerPrincipalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
    novoItem: ${novoItem},
    listaItens: ${listaItens}
    ''';
  }
}
