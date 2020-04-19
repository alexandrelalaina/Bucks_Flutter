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
  Computed<bool> _$hasResultsItemComputed;

  @override
  bool get hasResultsItem =>
      (_$hasResultsItemComputed ??= Computed<bool>(() => super.hasResultsItem))
          .value;
  Computed<bool> _$hasResultsProducaoComputed;

  @override
  bool get hasResultsProducao => (_$hasResultsProducaoComputed ??=
          Computed<bool>(() => super.hasResultsProducao))
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

  final _$producaoItemAtom =
      Atom(name: '_ProducaoItemListControllerBase.producaoItem');

  @override
  ProducaoItem get producaoItem {
    _$producaoItemAtom.context.enforceReadPolicy(_$producaoItemAtom);
    _$producaoItemAtom.reportObserved();
    return super.producaoItem;
  }

  @override
  set producaoItem(ProducaoItem value) {
    _$producaoItemAtom.context.conditionallyRunInAction(() {
      super.producaoItem = value;
      _$producaoItemAtom.reportChanged();
    }, _$producaoItemAtom, name: '${_$producaoItemAtom.name}_set');
  }

  final _$itemAtom = Atom(name: '_ProducaoItemListControllerBase.item');

  @override
  Item get item {
    _$itemAtom.context.enforceReadPolicy(_$itemAtom);
    _$itemAtom.reportObserved();
    return super.item;
  }

  @override
  set item(Item value) {
    _$itemAtom.context.conditionallyRunInAction(() {
      super.item = value;
      _$itemAtom.reportChanged();
    }, _$itemAtom, name: '${_$itemAtom.name}_set');
  }

  final _$producaoAtom = Atom(name: '_ProducaoItemListControllerBase.producao');

  @override
  Producao get producao {
    _$producaoAtom.context.enforceReadPolicy(_$producaoAtom);
    _$producaoAtom.reportObserved();
    return super.producao;
  }

  @override
  set producao(Producao value) {
    _$producaoAtom.context.conditionallyRunInAction(() {
      super.producao = value;
      _$producaoAtom.reportChanged();
    }, _$producaoAtom, name: '${_$producaoAtom.name}_set');
  }

  final _$producaoItemListAtom =
      Atom(name: '_ProducaoItemListControllerBase.producaoItemList');

  @override
  ObservableFuture<List<ProducaoItem>> get producaoItemList {
    _$producaoItemListAtom.context.enforceReadPolicy(_$producaoItemListAtom);
    _$producaoItemListAtom.reportObserved();
    return super.producaoItemList;
  }

  @override
  set producaoItemList(ObservableFuture<List<ProducaoItem>> value) {
    _$producaoItemListAtom.context.conditionallyRunInAction(() {
      super.producaoItemList = value;
      _$producaoItemListAtom.reportChanged();
    }, _$producaoItemListAtom, name: '${_$producaoItemListAtom.name}_set');
  }

  final _$itensListAtom =
      Atom(name: '_ProducaoItemListControllerBase.itensList');

  @override
  ObservableFuture<List<Item>> get itensList {
    _$itensListAtom.context.enforceReadPolicy(_$itensListAtom);
    _$itensListAtom.reportObserved();
    return super.itensList;
  }

  @override
  set itensList(ObservableFuture<List<Item>> value) {
    _$itensListAtom.context.conditionallyRunInAction(() {
      super.itensList = value;
      _$itensListAtom.reportChanged();
    }, _$itensListAtom, name: '${_$itensListAtom.name}_set');
  }

  final _$producaoListAtom =
      Atom(name: '_ProducaoItemListControllerBase.producaoList');

  @override
  ObservableFuture<List<Producao>> get producaoList {
    _$producaoListAtom.context.enforceReadPolicy(_$producaoListAtom);
    _$producaoListAtom.reportObserved();
    return super.producaoList;
  }

  @override
  set producaoList(ObservableFuture<List<Producao>> value) {
    _$producaoListAtom.context.conditionallyRunInAction(() {
      super.producaoList = value;
      _$producaoListAtom.reportChanged();
    }, _$producaoListAtom, name: '${_$producaoListAtom.name}_set');
  }

  final _$fetchItemAsyncAction = AsyncAction('fetchItem');

  @override
  Future<List<Item>> fetchItem() {
    return _$fetchItemAsyncAction.run(() => super.fetchItem());
  }

  final _$fetchProducaoAsyncAction = AsyncAction('fetchProducao');

  @override
  Future<List<Producao>> fetchProducao() {
    return _$fetchProducaoAsyncAction.run(() => super.fetchProducao());
  }

  final _$listarProducaoItensAsyncAction = AsyncAction('listarProducaoItens');

  @override
  Future<List<ProducaoItem>> listarProducaoItens() {
    return _$listarProducaoItensAsyncAction
        .run(() => super.listarProducaoItens());
  }

  final _$validateDropDownsAsyncAction = AsyncAction('validateDropDowns');

  @override
  Future<String> validateDropDowns() {
    return _$validateDropDownsAsyncAction.run(() => super.validateDropDowns());
  }

  final _$setItemAsyncAction = AsyncAction('setItem');

  @override
  Future setItem(Item model) {
    return _$setItemAsyncAction.run(() => super.setItem(model));
  }

  final _$setProducaoAsyncAction = AsyncAction('setProducao');

  @override
  Future setProducao(Producao model) {
    return _$setProducaoAsyncAction.run(() => super.setProducao(model));
  }
}
