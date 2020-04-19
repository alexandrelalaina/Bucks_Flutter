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

  final _$listarAsyncAction = AsyncAction('listar');

  @override
  Future<List<MovtoEstoque>> listar() {
    return _$listarAsyncAction.run(() => super.listar());
  }
}
