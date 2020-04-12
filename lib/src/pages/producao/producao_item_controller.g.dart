// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producao_item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProducaoItemController on _ProducaoItemControllerBase, Store {
  final _$tecFkProducaoIdAtom =
      Atom(name: '_ProducaoItemControllerBase.tecFkProducaoId');

  @override
  TextEditingController get tecFkProducaoId {
    _$tecFkProducaoIdAtom.context.enforceReadPolicy(_$tecFkProducaoIdAtom);
    _$tecFkProducaoIdAtom.reportObserved();
    return super.tecFkProducaoId;
  }

  @override
  set tecFkProducaoId(TextEditingController value) {
    _$tecFkProducaoIdAtom.context.conditionallyRunInAction(() {
      super.tecFkProducaoId = value;
      _$tecFkProducaoIdAtom.reportChanged();
    }, _$tecFkProducaoIdAtom, name: '${_$tecFkProducaoIdAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_ProducaoItemControllerBase.value');

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

  final _$salvarAsyncAction = AsyncAction('salvar');

  @override
  Future salvar(
      {@required ProducaoItemController store,
      @required ProducaoItemListController storeProducaoItemList}) {
    return _$salvarAsyncAction.run(() => super
        .salvar(store: store, storeProducaoItemList: storeProducaoItemList));
  }

  final _$_ProducaoItemControllerBaseActionController =
      ActionController(name: '_ProducaoItemControllerBase');

  @override
  void increment() {
    final _$actionInfo =
        _$_ProducaoItemControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_ProducaoItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
