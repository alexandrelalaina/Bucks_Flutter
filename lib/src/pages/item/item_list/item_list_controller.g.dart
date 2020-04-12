// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemListController on _ItemListControllerBase, Store {
  Computed<bool> _$hasResultsItensComputed;

  @override
  bool get hasResultsItens => (_$hasResultsItensComputed ??=
          Computed<bool>(() => super.hasResultsItens))
      .value;
  Computed<bool> _$hasResultsItemTipoComputed;

  @override
  bool get hasResultsItemTipo => (_$hasResultsItemTipoComputed ??=
          Computed<bool>(() => super.hasResultsItemTipo))
      .value;
  Computed<bool> _$hasResultsItemGrupoComputed;

  @override
  bool get hasResultsItemGrupo => (_$hasResultsItemGrupoComputed ??=
          Computed<bool>(() => super.hasResultsItemGrupo))
      .value;
  Computed<bool> _$hasResultsItemUnMedComputed;

  @override
  bool get hasResultsItemUnMed => (_$hasResultsItemUnMedComputed ??=
          Computed<bool>(() => super.hasResultsItemUnMed))
      .value;

  final _$itensAtom = Atom(name: '_ItemListControllerBase.itens');

  @override
  List<Item> get itens {
    _$itensAtom.context.enforceReadPolicy(_$itensAtom);
    _$itensAtom.reportObserved();
    return super.itens;
  }

  @override
  set itens(List<Item> value) {
    _$itensAtom.context.conditionallyRunInAction(() {
      super.itens = value;
      _$itensAtom.reportChanged();
    }, _$itensAtom, name: '${_$itensAtom.name}_set');
  }

  final _$itemAtom = Atom(name: '_ItemListControllerBase.item');

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

  final _$itemTipoAtom = Atom(name: '_ItemListControllerBase.itemTipo');

  @override
  ItemTipo get itemTipo {
    _$itemTipoAtom.context.enforceReadPolicy(_$itemTipoAtom);
    _$itemTipoAtom.reportObserved();
    return super.itemTipo;
  }

  @override
  set itemTipo(ItemTipo value) {
    _$itemTipoAtom.context.conditionallyRunInAction(() {
      super.itemTipo = value;
      _$itemTipoAtom.reportChanged();
    }, _$itemTipoAtom, name: '${_$itemTipoAtom.name}_set');
  }

  final _$itemGrupoAtom = Atom(name: '_ItemListControllerBase.itemGrupo');

  @override
  ItemGrupo get itemGrupo {
    _$itemGrupoAtom.context.enforceReadPolicy(_$itemGrupoAtom);
    _$itemGrupoAtom.reportObserved();
    return super.itemGrupo;
  }

  @override
  set itemGrupo(ItemGrupo value) {
    _$itemGrupoAtom.context.conditionallyRunInAction(() {
      super.itemGrupo = value;
      _$itemGrupoAtom.reportChanged();
    }, _$itemGrupoAtom, name: '${_$itemGrupoAtom.name}_set');
  }

  final _$itemUnMedAtom = Atom(name: '_ItemListControllerBase.itemUnMed');

  @override
  ItemUnMed get itemUnMed {
    _$itemUnMedAtom.context.enforceReadPolicy(_$itemUnMedAtom);
    _$itemUnMedAtom.reportObserved();
    return super.itemUnMed;
  }

  @override
  set itemUnMed(ItemUnMed value) {
    _$itemUnMedAtom.context.conditionallyRunInAction(() {
      super.itemUnMed = value;
      _$itemUnMedAtom.reportChanged();
    }, _$itemUnMedAtom, name: '${_$itemUnMedAtom.name}_set');
  }

  final _$itensListAtom = Atom(name: '_ItemListControllerBase.itensList');

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

  final _$itemTipoListAtom = Atom(name: '_ItemListControllerBase.itemTipoList');

  @override
  ObservableFuture<List<ItemTipo>> get itemTipoList {
    _$itemTipoListAtom.context.enforceReadPolicy(_$itemTipoListAtom);
    _$itemTipoListAtom.reportObserved();
    return super.itemTipoList;
  }

  @override
  set itemTipoList(ObservableFuture<List<ItemTipo>> value) {
    _$itemTipoListAtom.context.conditionallyRunInAction(() {
      super.itemTipoList = value;
      _$itemTipoListAtom.reportChanged();
    }, _$itemTipoListAtom, name: '${_$itemTipoListAtom.name}_set');
  }

  final _$itemGrupoListAtom =
      Atom(name: '_ItemListControllerBase.itemGrupoList');

  @override
  ObservableFuture<List<ItemGrupo>> get itemGrupoList {
    _$itemGrupoListAtom.context.enforceReadPolicy(_$itemGrupoListAtom);
    _$itemGrupoListAtom.reportObserved();
    return super.itemGrupoList;
  }

  @override
  set itemGrupoList(ObservableFuture<List<ItemGrupo>> value) {
    _$itemGrupoListAtom.context.conditionallyRunInAction(() {
      super.itemGrupoList = value;
      _$itemGrupoListAtom.reportChanged();
    }, _$itemGrupoListAtom, name: '${_$itemGrupoListAtom.name}_set');
  }

  final _$itemUnMedListAtom =
      Atom(name: '_ItemListControllerBase.itemUnMedList');

  @override
  ObservableFuture<List<ItemUnMed>> get itemUnMedList {
    _$itemUnMedListAtom.context.enforceReadPolicy(_$itemUnMedListAtom);
    _$itemUnMedListAtom.reportObserved();
    return super.itemUnMedList;
  }

  @override
  set itemUnMedList(ObservableFuture<List<ItemUnMed>> value) {
    _$itemUnMedListAtom.context.conditionallyRunInAction(() {
      super.itemUnMedList = value;
      _$itemUnMedListAtom.reportChanged();
    }, _$itemUnMedListAtom, name: '${_$itemUnMedListAtom.name}_set');
  }

  final _$fetchItemTipoAsyncAction = AsyncAction('fetchItemTipo');

  @override
  Future<List<ItemTipo>> fetchItemTipo() {
    return _$fetchItemTipoAsyncAction.run(() => super.fetchItemTipo());
  }

  final _$fetchItemGrupoAsyncAction = AsyncAction('fetchItemGrupo');

  @override
  Future<List<ItemGrupo>> fetchItemGrupo() {
    return _$fetchItemGrupoAsyncAction.run(() => super.fetchItemGrupo());
  }

  final _$fetchItemUnMedAsyncAction = AsyncAction('fetchItemUnMed');

  @override
  Future<List<ItemUnMed>> fetchItemUnMed() {
    return _$fetchItemUnMedAsyncAction.run(() => super.fetchItemUnMed());
  }

  final _$listarItensAsyncAction = AsyncAction('listarItens');

  @override
  Future<List<Item>> listarItens() {
    return _$listarItensAsyncAction.run(() => super.listarItens());
  }

  final _$listarDescrItemTipoAsyncAction = AsyncAction('listarDescrItemTipo');

  @override
  Future<String> listarDescrItemTipo() {
    return _$listarDescrItemTipoAsyncAction
        .run(() => super.listarDescrItemTipo());
  }

  final _$validateDropDownsAsyncAction = AsyncAction('validateDropDowns');

  @override
  Future<String> validateDropDowns() {
    return _$validateDropDownsAsyncAction.run(() => super.validateDropDowns());
  }

  final _$setItemTipoAsyncAction = AsyncAction('setItemTipo');

  @override
  Future setItemTipo(ItemTipo model) {
    return _$setItemTipoAsyncAction.run(() => super.setItemTipo(model));
  }

  final _$setItemGrupoAsyncAction = AsyncAction('setItemGrupo');

  @override
  Future setItemGrupo(ItemGrupo model) {
    return _$setItemGrupoAsyncAction.run(() => super.setItemGrupo(model));
  }

  final _$setItemUnMedAsyncAction = AsyncAction('setItemUnMed');

  @override
  Future setItemUnMed(ItemUnMed model) {
    return _$setItemUnMedAsyncAction.run(() => super.setItemUnMed(model));
  }
}
