// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_unmed_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemUnMedListController on _ItemUnMedListControllerBase, Store {
  Computed<bool> _$hasResultsItensUnMedComputed;

  @override
  bool get hasResultsItensUnMed => (_$hasResultsItensUnMedComputed ??=
          Computed<bool>(() => super.hasResultsItensUnMed))
      .value;

  final _$itensUnMedAtom =
      Atom(name: '_ItemUnMedListControllerBase.itensUnMed');

  @override
  List<ItemUnMed> get itensUnMed {
    _$itensUnMedAtom.context.enforceReadPolicy(_$itensUnMedAtom);
    _$itensUnMedAtom.reportObserved();
    return super.itensUnMed;
  }

  @override
  set itensUnMed(List<ItemUnMed> value) {
    _$itensUnMedAtom.context.conditionallyRunInAction(() {
      super.itensUnMed = value;
      _$itensUnMedAtom.reportChanged();
    }, _$itensUnMedAtom, name: '${_$itensUnMedAtom.name}_set');
  }

  final _$itensUnMedListAtom =
      Atom(name: '_ItemUnMedListControllerBase.itensUnMedList');

  @override
  ObservableFuture<List<ItemUnMed>> get itensUnMedList {
    _$itensUnMedListAtom.context.enforceReadPolicy(_$itensUnMedListAtom);
    _$itensUnMedListAtom.reportObserved();
    return super.itensUnMedList;
  }

  @override
  set itensUnMedList(ObservableFuture<List<ItemUnMed>> value) {
    _$itensUnMedListAtom.context.conditionallyRunInAction(() {
      super.itensUnMedList = value;
      _$itensUnMedListAtom.reportChanged();
    }, _$itensUnMedListAtom, name: '${_$itensUnMedListAtom.name}_set');
  }

  final _$listarAsyncAction = AsyncAction('listar');

  @override
  Future<List<ItemUnMed>> listar() {
    return _$listarAsyncAction.run(() => super.listar());
  }
}
