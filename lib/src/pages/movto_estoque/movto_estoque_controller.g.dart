// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movto_estoque_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovtoEstoqueController on _MovtoEstoqueControllerBase, Store {
  final _$dtAtom = Atom(name: '_MovtoEstoqueControllerBase.dt');

  @override
  TextEditingController get dt {
    _$dtAtom.context.enforceReadPolicy(_$dtAtom);
    _$dtAtom.reportObserved();
    return super.dt;
  }

  @override
  set dt(TextEditingController value) {
    _$dtAtom.context.conditionallyRunInAction(() {
      super.dt = value;
      _$dtAtom.reportChanged();
    }, _$dtAtom, name: '${_$dtAtom.name}_set');
  }

  final _$qtdAtom = Atom(name: '_MovtoEstoqueControllerBase.qtd');

  @override
  TextEditingController get qtd {
    _$qtdAtom.context.enforceReadPolicy(_$qtdAtom);
    _$qtdAtom.reportObserved();
    return super.qtd;
  }

  @override
  set qtd(TextEditingController value) {
    _$qtdAtom.context.conditionallyRunInAction(() {
      super.qtd = value;
      _$qtdAtom.reportChanged();
    }, _$qtdAtom, name: '${_$qtdAtom.name}_set');
  }

  final _$vlTotalAtom = Atom(name: '_MovtoEstoqueControllerBase.vlTotal');

  @override
  TextEditingController get vlTotal {
    _$vlTotalAtom.context.enforceReadPolicy(_$vlTotalAtom);
    _$vlTotalAtom.reportObserved();
    return super.vlTotal;
  }

  @override
  set vlTotal(TextEditingController value) {
    _$vlTotalAtom.context.conditionallyRunInAction(() {
      super.vlTotal = value;
      _$vlTotalAtom.reportChanged();
    }, _$vlTotalAtom, name: '${_$vlTotalAtom.name}_set');
  }

  final _$vlUnitAtom = Atom(name: '_MovtoEstoqueControllerBase.vlUnit');

  @override
  TextEditingController get vlUnit {
    _$vlUnitAtom.context.enforceReadPolicy(_$vlUnitAtom);
    _$vlUnitAtom.reportObserved();
    return super.vlUnit;
  }

  @override
  set vlUnit(TextEditingController value) {
    _$vlUnitAtom.context.conditionallyRunInAction(() {
      super.vlUnit = value;
      _$vlUnitAtom.reportChanged();
    }, _$vlUnitAtom, name: '${_$vlUnitAtom.name}_set');
  }

  final _$loteAtom = Atom(name: '_MovtoEstoqueControllerBase.lote');

  @override
  TextEditingController get lote {
    _$loteAtom.context.enforceReadPolicy(_$loteAtom);
    _$loteAtom.reportObserved();
    return super.lote;
  }

  @override
  set lote(TextEditingController value) {
    _$loteAtom.context.conditionallyRunInAction(() {
      super.lote = value;
      _$loteAtom.reportChanged();
    }, _$loteAtom, name: '${_$loteAtom.name}_set');
  }

  final _$salvarAsyncAction = AsyncAction('salvar');

  @override
  Future salvar(
      {@required MovtoEstoqueController store,
      @required MovtoEstoqueListController storeMovtoEstoqueList}) {
    return _$salvarAsyncAction.run(() => super
        .salvar(store: store, storeMovtoEstoqueList: storeMovtoEstoqueList));
  }
}
