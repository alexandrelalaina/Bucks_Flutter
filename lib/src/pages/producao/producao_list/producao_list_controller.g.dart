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

  final _$listarAsyncAction = AsyncAction('listar');

  @override
  Future<List<Producao>> listar() {
    return _$listarAsyncAction.run(() => super.listar());
  }
}
