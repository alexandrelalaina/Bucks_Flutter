// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProducaoController on _ProducaoControllerBase, Store {
  final _$idAtom = Atom(name: '_ProducaoControllerBase.id');

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

  final _$valueAtom = Atom(name: '_ProducaoControllerBase.value');

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
      {@required ProducaoController store,
      @required ProducaoListController storeProducaoList}) {
    return _$salvarAsyncAction.run(
        () => super.salvar(store: store, storeProducaoList: storeProducaoList));
  }

  final _$_ProducaoControllerBaseActionController =
      ActionController(name: '_ProducaoControllerBase');

  @override
  void increment() {
    final _$actionInfo =
        _$_ProducaoControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_ProducaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
