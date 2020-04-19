// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producao_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProducaoListController on _ProducaoListControllerBase, Store {
  Computed<bool> _$hasResultsProducaoComputed;

  @override
  bool get hasResultsProducao => (_$hasResultsProducaoComputed ??=
          Computed<bool>(() => super.hasResultsProducao))
      .value;
  Computed<bool> _$hasResultsProducaoItemDtComputed;

  @override
  bool get hasResultsProducaoItemDt => (_$hasResultsProducaoItemDtComputed ??=
          Computed<bool>(() => super.hasResultsProducaoItemDt))
      .value;
  Computed<bool> _$hasResultsProducaoItemComputed;

  @override
  bool get hasResultsProducaoItem => (_$hasResultsProducaoItemComputed ??=
          Computed<bool>(() => super.hasResultsProducaoItem))
      .value;
  Computed<bool> _$hasResultsItemEstoqueComputed;

  @override
  bool get hasResultsItemEstoque => (_$hasResultsItemEstoqueComputed ??=
          Computed<bool>(() => super.hasResultsItemEstoque))
      .value;

  final _$producoesAtom = Atom(name: '_ProducaoListControllerBase.producoes');

  @override
  List<Producao> get producoes {
    _$producoesAtom.context.enforceReadPolicy(_$producoesAtom);
    _$producoesAtom.reportObserved();
    return super.producoes;
  }

  @override
  set producoes(List<Producao> value) {
    _$producoesAtom.context.conditionallyRunInAction(() {
      super.producoes = value;
      _$producoesAtom.reportChanged();
    }, _$producoesAtom, name: '${_$producoesAtom.name}_set');
  }

  final _$producaoItensDtAtom =
      Atom(name: '_ProducaoListControllerBase.producaoItensDt');

  @override
  List<ProducaoItem> get producaoItensDt {
    _$producaoItensDtAtom.context.enforceReadPolicy(_$producaoItensDtAtom);
    _$producaoItensDtAtom.reportObserved();
    return super.producaoItensDt;
  }

  @override
  set producaoItensDt(List<ProducaoItem> value) {
    _$producaoItensDtAtom.context.conditionallyRunInAction(() {
      super.producaoItensDt = value;
      _$producaoItensDtAtom.reportChanged();
    }, _$producaoItensDtAtom, name: '${_$producaoItensDtAtom.name}_set');
  }

  final _$itemsEstoqueAtom =
      Atom(name: '_ProducaoListControllerBase.itemsEstoque');

  @override
  List<ItemEstoque> get itemsEstoque {
    _$itemsEstoqueAtom.context.enforceReadPolicy(_$itemsEstoqueAtom);
    _$itemsEstoqueAtom.reportObserved();
    return super.itemsEstoque;
  }

  @override
  set itemsEstoque(List<ItemEstoque> value) {
    _$itemsEstoqueAtom.context.conditionallyRunInAction(() {
      super.itemsEstoque = value;
      _$itemsEstoqueAtom.reportChanged();
    }, _$itemsEstoqueAtom, name: '${_$itemsEstoqueAtom.name}_set');
  }

  final _$ultProdInseridaAtom =
      Atom(name: '_ProducaoListControllerBase.ultProdInserida');

  @override
  List<Producao> get ultProdInserida {
    _$ultProdInseridaAtom.context.enforceReadPolicy(_$ultProdInseridaAtom);
    _$ultProdInseridaAtom.reportObserved();
    return super.ultProdInserida;
  }

  @override
  set ultProdInserida(List<Producao> value) {
    _$ultProdInseridaAtom.context.conditionallyRunInAction(() {
      super.ultProdInserida = value;
      _$ultProdInseridaAtom.reportChanged();
    }, _$ultProdInseridaAtom, name: '${_$ultProdInseridaAtom.name}_set');
  }

  final _$itemEstoqueAtom =
      Atom(name: '_ProducaoListControllerBase.itemEstoque');

  @override
  ItemEstoque get itemEstoque {
    _$itemEstoqueAtom.context.enforceReadPolicy(_$itemEstoqueAtom);
    _$itemEstoqueAtom.reportObserved();
    return super.itemEstoque;
  }

  @override
  set itemEstoque(ItemEstoque value) {
    _$itemEstoqueAtom.context.conditionallyRunInAction(() {
      super.itemEstoque = value;
      _$itemEstoqueAtom.reportChanged();
    }, _$itemEstoqueAtom, name: '${_$itemEstoqueAtom.name}_set');
  }

  final _$producaoItemAtom =
      Atom(name: '_ProducaoListControllerBase.producaoItem');

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

  final _$producaoAtom = Atom(name: '_ProducaoListControllerBase.producao');

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

  final _$producoesListAtom =
      Atom(name: '_ProducaoListControllerBase.producoesList');

  @override
  ObservableFuture<List<Producao>> get producoesList {
    _$producoesListAtom.context.enforceReadPolicy(_$producoesListAtom);
    _$producoesListAtom.reportObserved();
    return super.producoesList;
  }

  @override
  set producoesList(ObservableFuture<List<Producao>> value) {
    _$producoesListAtom.context.conditionallyRunInAction(() {
      super.producoesList = value;
      _$producoesListAtom.reportChanged();
    }, _$producoesListAtom, name: '${_$producoesListAtom.name}_set');
  }

  final _$producaoItemListDtAtom =
      Atom(name: '_ProducaoListControllerBase.producaoItemListDt');

  @override
  ObservableFuture<List<ProducaoItem>> get producaoItemListDt {
    _$producaoItemListDtAtom.context
        .enforceReadPolicy(_$producaoItemListDtAtom);
    _$producaoItemListDtAtom.reportObserved();
    return super.producaoItemListDt;
  }

  @override
  set producaoItemListDt(ObservableFuture<List<ProducaoItem>> value) {
    _$producaoItemListDtAtom.context.conditionallyRunInAction(() {
      super.producaoItemListDt = value;
      _$producaoItemListDtAtom.reportChanged();
    }, _$producaoItemListDtAtom, name: '${_$producaoItemListDtAtom.name}_set');
  }

  final _$producaoItemListAtom =
      Atom(name: '_ProducaoListControllerBase.producaoItemList');

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

  final _$itemEstoqueListAtom =
      Atom(name: '_ProducaoListControllerBase.itemEstoqueList');

  @override
  ObservableFuture<List<ItemEstoque>> get itemEstoqueList {
    _$itemEstoqueListAtom.context.enforceReadPolicy(_$itemEstoqueListAtom);
    _$itemEstoqueListAtom.reportObserved();
    return super.itemEstoqueList;
  }

  @override
  set itemEstoqueList(ObservableFuture<List<ItemEstoque>> value) {
    _$itemEstoqueListAtom.context.conditionallyRunInAction(() {
      super.itemEstoqueList = value;
      _$itemEstoqueListAtom.reportChanged();
    }, _$itemEstoqueListAtom, name: '${_$itemEstoqueListAtom.name}_set');
  }

  final _$listarItemEstoqueAsyncAction = AsyncAction('listarItemEstoque');

  @override
  Future<List<ItemEstoque>> listarItemEstoque() {
    return _$listarItemEstoqueAsyncAction.run(() => super.listarItemEstoque());
  }

  final _$listarProducaoByDescrAsyncAction =
      AsyncAction('listarProducaoByDescr');

  @override
  Future<List<Producao>> listarProducaoByDescr(String descr) {
    return _$listarProducaoByDescrAsyncAction
        .run(() => super.listarProducaoByDescr(descr));
  }

  final _$setLixoAsyncAction = AsyncAction('setLixo');

  @override
  Future setLixo() {
    return _$setLixoAsyncAction.run(() => super.setLixo());
  }

  final _$setProducaoAsyncAction = AsyncAction('setProducao');

  @override
  Future setProducao(ItemEstoque model, String descrUltProdInserida) {
    return _$setProducaoAsyncAction
        .run(() => super.setProducao(model, descrUltProdInserida));
  }

  final _$listarAsyncAction = AsyncAction('listar');

  @override
  Future<List<Producao>> listar() {
    return _$listarAsyncAction.run(() => super.listar());
  }

  final _$removeitemsDataTableAsyncAction = AsyncAction('removeitemsDataTable');

  @override
  Future removeitemsDataTable(ProducaoItem data) {
    return _$removeitemsDataTableAsyncAction
        .run(() => super.removeitemsDataTable(data));
  }

  final _$_ProducaoListControllerBaseActionController =
      ActionController(name: '_ProducaoListControllerBase');

  @override
  bool validaDataTablePossuiItem(String descrItem) {
    final _$actionInfo =
        _$_ProducaoListControllerBaseActionController.startAction();
    try {
      return super.validaDataTablePossuiItem(descrItem);
    } finally {
      _$_ProducaoListControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
