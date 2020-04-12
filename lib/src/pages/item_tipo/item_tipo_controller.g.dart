// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_tipo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemTipoController on _ItemTipoControllerBase, Store {
  final _$descricaoAtom = Atom(name: '_ItemTipoControllerBase.descricao');

  @override
  TextEditingController get descricao {
    _$descricaoAtom.context.enforceReadPolicy(_$descricaoAtom);
    _$descricaoAtom.reportObserved();
    return super.descricao;
  }

  @override
  set descricao(TextEditingController value) {
    _$descricaoAtom.context.conditionallyRunInAction(() {
      super.descricao = value;
      _$descricaoAtom.reportChanged();
    }, _$descricaoAtom, name: '${_$descricaoAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_ItemTipoControllerBase.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$salvarItemTipoAsyncAction = AsyncAction('salvarItemTipo');

  @override
  Future salvarItemTipo(
      {@required ItemTipoController store,
      @required ItemTipoListController storeItemTipoList}) {
    return _$salvarItemTipoAsyncAction.run(() => super
        .salvarItemTipo(store: store, storeItemTipoList: storeItemTipoList));
  }

  final _$_ItemTipoControllerBaseActionController =
      ActionController(name: '_ItemTipoControllerBase');

  @override
  void increment() {
    final _$actionInfo =
        _$_ItemTipoControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_ItemTipoControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
