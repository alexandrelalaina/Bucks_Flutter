// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemController on _ItemControllerBase, Store {
  final _$idAtom = Atom(name: '_ItemControllerBase.id');

  @override
  TextEditingController get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(TextEditingController value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$descricaoAtom = Atom(name: '_ItemControllerBase.descricao');

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

  final _$cdControlaEstoqueAtom =
      Atom(name: '_ItemControllerBase.cdControlaEstoque');

  @override
  TextEditingController get cdControlaEstoque {
    _$cdControlaEstoqueAtom.context.enforceReadPolicy(_$cdControlaEstoqueAtom);
    _$cdControlaEstoqueAtom.reportObserved();
    return super.cdControlaEstoque;
  }

  @override
  set cdControlaEstoque(TextEditingController value) {
    _$cdControlaEstoqueAtom.context.conditionallyRunInAction(() {
      super.cdControlaEstoque = value;
      _$cdControlaEstoqueAtom.reportChanged();
    }, _$cdControlaEstoqueAtom, name: '${_$cdControlaEstoqueAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_ItemControllerBase.value');

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

  final _$salvarItemAsyncAction = AsyncAction('salvarItem');

  @override
  Future salvarItem(
      {@required ItemController store,
      @required ItemListController storeItemList}) {
    return _$salvarItemAsyncAction.run(
        () => super.salvarItem(store: store, storeItemList: storeItemList));
  }

  final _$_ItemControllerBaseActionController =
      ActionController(name: '_ItemControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ItemControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_ItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
