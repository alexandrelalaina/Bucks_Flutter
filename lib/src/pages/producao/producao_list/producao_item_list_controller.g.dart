// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producao_item_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProducaoItemListController on _ProducaoItemListControllerBase, Store {
  Computed<bool> _$hasResultsProducaoItemComputed;

  @override
  bool get hasResultsProducaoItem => (_$hasResultsProducaoItemComputed ??=
          Computed<bool>(() => super.hasResultsProducaoItem))
      .value;

  final _$producaoItensAtom =
      Atom(name: '_ProducaoItemListControllerBase.producaoItens');

  @override
  List<ProducaoItem> get producaoItens {
    _$producaoItensAtom.context.enforceReadPolicy(_$producaoItensAtom);
    _$producaoItensAtom.reportObserved();
    return super.producaoItens;
  }

  @override
  set producaoItens(List<ProducaoItem> value) {
    _$producaoItensAtom.context.conditionallyRunInAction(() {
      super.producaoItens = value;
      _$producaoItensAtom.reportChanged();
    }, _$producaoItensAtom, name: '${_$producaoItensAtom.name}_set');
  }

  final _$producaoItensListAtom =
      Atom(name: '_ProducaoItemListControllerBase.producaoItensList');

  @override
  ObservableFuture<List<ProducaoItem>> get producaoItensList {
    _$producaoItensListAtom.context.enforceReadPolicy(_$producaoItensListAtom);
    _$producaoItensListAtom.reportObserved();
    return super.producaoItensList;
  }

  @override
  set producaoItensList(ObservableFuture<List<ProducaoItem>> value) {
    _$producaoItensListAtom.context.conditionallyRunInAction(() {
      super.producaoItensList = value;
      _$producaoItensListAtom.reportChanged();
    }, _$producaoItensListAtom, name: '${_$producaoItensListAtom.name}_set');
  }

  final _$listarAsyncAction = AsyncAction('listar');

  @override
  Future<List<ProducaoItem>> listar(int fkProducaoId) {
    return _$listarAsyncAction.run(() => super.listar(fkProducaoId));
  }
}
