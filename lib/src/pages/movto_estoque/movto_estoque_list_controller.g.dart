// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movto_estoque_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovtoEstoqueListController on _MovtoEstoqueListControllerBase, Store {
  Computed<bool> _$hasResultsComputed;

  @override
  bool get hasResults =>
      (_$hasResultsComputed ??= Computed<bool>(() => super.hasResults)).value;
  Computed<bool> _$hasResultsItemComputed;

  @override
  bool get hasResultsItem =>
      (_$hasResultsItemComputed ??= Computed<bool>(() => super.hasResultsItem))
          .value;
  Computed<bool> _$hasResultsMovtoTipoComputed;

  @override
  bool get hasResultsMovtoTipo => (_$hasResultsMovtoTipoComputed ??=
          Computed<bool>(() => super.hasResultsMovtoTipo))
      .value;

  final _$movtosEstoqueAtom =
      Atom(name: '_MovtoEstoqueListControllerBase.movtosEstoque');

  @override
  List<MovtoEstoque> get movtosEstoque {
    _$movtosEstoqueAtom.context.enforceReadPolicy(_$movtosEstoqueAtom);
    _$movtosEstoqueAtom.reportObserved();
    return super.movtosEstoque;
  }

  @override
  set movtosEstoque(List<MovtoEstoque> value) {
    _$movtosEstoqueAtom.context.conditionallyRunInAction(() {
      super.movtosEstoque = value;
      _$movtosEstoqueAtom.reportChanged();
    }, _$movtosEstoqueAtom, name: '${_$movtosEstoqueAtom.name}_set');
  }

  final _$lovItemSelectedAtom =
      Atom(name: '_MovtoEstoqueListControllerBase.lovItemSelected');

  @override
  Item get lovItemSelected {
    _$lovItemSelectedAtom.context.enforceReadPolicy(_$lovItemSelectedAtom);
    _$lovItemSelectedAtom.reportObserved();
    return super.lovItemSelected;
  }

  @override
  set lovItemSelected(Item value) {
    _$lovItemSelectedAtom.context.conditionallyRunInAction(() {
      super.lovItemSelected = value;
      _$lovItemSelectedAtom.reportChanged();
    }, _$lovItemSelectedAtom, name: '${_$lovItemSelectedAtom.name}_set');
  }

  final _$lovMovtoEstoqueTipoSelectedAtom =
      Atom(name: '_MovtoEstoqueListControllerBase.lovMovtoEstoqueTipoSelected');

  @override
  MovtoEstoqueTipo get lovMovtoEstoqueTipoSelected {
    _$lovMovtoEstoqueTipoSelectedAtom.context
        .enforceReadPolicy(_$lovMovtoEstoqueTipoSelectedAtom);
    _$lovMovtoEstoqueTipoSelectedAtom.reportObserved();
    return super.lovMovtoEstoqueTipoSelected;
  }

  @override
  set lovMovtoEstoqueTipoSelected(MovtoEstoqueTipo value) {
    _$lovMovtoEstoqueTipoSelectedAtom.context.conditionallyRunInAction(() {
      super.lovMovtoEstoqueTipoSelected = value;
      _$lovMovtoEstoqueTipoSelectedAtom.reportChanged();
    }, _$lovMovtoEstoqueTipoSelectedAtom,
        name: '${_$lovMovtoEstoqueTipoSelectedAtom.name}_set');
  }

  final _$movtosEstoqueListAtom =
      Atom(name: '_MovtoEstoqueListControllerBase.movtosEstoqueList');

  @override
  ObservableFuture<List<MovtoEstoque>> get movtosEstoqueList {
    _$movtosEstoqueListAtom.context.enforceReadPolicy(_$movtosEstoqueListAtom);
    _$movtosEstoqueListAtom.reportObserved();
    return super.movtosEstoqueList;
  }

  @override
  set movtosEstoqueList(ObservableFuture<List<MovtoEstoque>> value) {
    _$movtosEstoqueListAtom.context.conditionallyRunInAction(() {
      super.movtosEstoqueList = value;
      _$movtosEstoqueListAtom.reportChanged();
    }, _$movtosEstoqueListAtom, name: '${_$movtosEstoqueListAtom.name}_set');
  }

  final _$itemListAtom = Atom(name: '_MovtoEstoqueListControllerBase.itemList');

  @override
  ObservableFuture<List<Item>> get itemList {
    _$itemListAtom.context.enforceReadPolicy(_$itemListAtom);
    _$itemListAtom.reportObserved();
    return super.itemList;
  }

  @override
  set itemList(ObservableFuture<List<Item>> value) {
    _$itemListAtom.context.conditionallyRunInAction(() {
      super.itemList = value;
      _$itemListAtom.reportChanged();
    }, _$itemListAtom, name: '${_$itemListAtom.name}_set');
  }

  final _$movtoTipoListAtom =
      Atom(name: '_MovtoEstoqueListControllerBase.movtoTipoList');

  @override
  ObservableFuture<List<MovtoEstoqueTipo>> get movtoTipoList {
    _$movtoTipoListAtom.context.enforceReadPolicy(_$movtoTipoListAtom);
    _$movtoTipoListAtom.reportObserved();
    return super.movtoTipoList;
  }

  @override
  set movtoTipoList(ObservableFuture<List<MovtoEstoqueTipo>> value) {
    _$movtoTipoListAtom.context.conditionallyRunInAction(() {
      super.movtoTipoList = value;
      _$movtoTipoListAtom.reportChanged();
    }, _$movtoTipoListAtom, name: '${_$movtoTipoListAtom.name}_set');
  }

  final _$validateDropDownsAsyncAction = AsyncAction('validateDropDowns');

  @override
  Future<String> validateDropDowns() {
    return _$validateDropDownsAsyncAction.run(() => super.validateDropDowns());
  }

  final _$listarAsyncAction = AsyncAction('listar');

  @override
  Future<List<MovtoEstoque>> listar() {
    return _$listarAsyncAction.run(() => super.listar());
  }

  final _$fetchItemAsyncAction = AsyncAction('fetchItem');

  @override
  Future<List<Item>> fetchItem() {
    return _$fetchItemAsyncAction.run(() => super.fetchItem());
  }

  final _$fetchMovtoTipoAsyncAction = AsyncAction('fetchMovtoTipo');

  @override
  Future<List<MovtoEstoqueTipo>> fetchMovtoTipo() {
    return _$fetchMovtoTipoAsyncAction.run(() => super.fetchMovtoTipo());
  }

  final _$setItemAsyncAction = AsyncAction('setItem');

  @override
  Future setItem(Item model) {
    return _$setItemAsyncAction.run(() => super.setItem(model));
  }

  final _$setMovtoEstoqueTipoAsyncAction = AsyncAction('setMovtoEstoqueTipo');

  @override
  Future setMovtoEstoqueTipo(MovtoEstoqueTipo model) {
    return _$setMovtoEstoqueTipoAsyncAction
        .run(() => super.setMovtoEstoqueTipo(model));
  }
}
