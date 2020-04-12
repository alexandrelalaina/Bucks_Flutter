// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_grupo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemGrupoController on _ItemGrupoControllerBase, Store {
  final _$descricaoAtom = Atom(name: '_ItemGrupoControllerBase.descricao');

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

  final _$valueAtom = Atom(name: '_ItemGrupoControllerBase.value');

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

  final _$salvarFarmaciaAsyncAction = AsyncAction('salvarFarmacia');

  @override
  Future salvarFarmacia(
      {@required ItemGrupoController store,
      @required ItemGrupoListController storeItemGrupoList}) {
    return _$salvarFarmaciaAsyncAction.run(() => super
        .salvarFarmacia(store: store, storeItemGrupoList: storeItemGrupoList));
  }

  final _$_ItemGrupoControllerBaseActionController =
      ActionController(name: '_ItemGrupoControllerBase');

  @override
  void increment() {
    final _$actionInfo =
        _$_ItemGrupoControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_ItemGrupoControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
