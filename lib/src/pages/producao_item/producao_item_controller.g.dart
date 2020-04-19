// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producao_item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProducaoItemController on _ProducaoItemControllerBase, Store {
  final _$cdTipoEntSaiAtom =
      Atom(name: '_ProducaoItemControllerBase.cdTipoEntSai');

  @override
  TextEditingController get cdTipoEntSai {
    _$cdTipoEntSaiAtom.context.enforceReadPolicy(_$cdTipoEntSaiAtom);
    _$cdTipoEntSaiAtom.reportObserved();
    return super.cdTipoEntSai;
  }

  @override
  set cdTipoEntSai(TextEditingController value) {
    _$cdTipoEntSaiAtom.context.conditionallyRunInAction(() {
      super.cdTipoEntSai = value;
      _$cdTipoEntSaiAtom.reportChanged();
    }, _$cdTipoEntSaiAtom, name: '${_$cdTipoEntSaiAtom.name}_set');
  }

  final _$qtAtom = Atom(name: '_ProducaoItemControllerBase.qt');

  @override
  TextEditingController get qt {
    _$qtAtom.context.enforceReadPolicy(_$qtAtom);
    _$qtAtom.reportObserved();
    return super.qt;
  }

  @override
  set qt(TextEditingController value) {
    _$qtAtom.context.conditionallyRunInAction(() {
      super.qt = value;
      _$qtAtom.reportChanged();
    }, _$qtAtom, name: '${_$qtAtom.name}_set');
  }

  final _$vlUnitAtom = Atom(name: '_ProducaoItemControllerBase.vlUnit');

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

  final _$cdStatusAtom = Atom(name: '_ProducaoItemControllerBase.cdStatus');

  @override
  TextEditingController get cdStatus {
    _$cdStatusAtom.context.enforceReadPolicy(_$cdStatusAtom);
    _$cdStatusAtom.reportObserved();
    return super.cdStatus;
  }

  @override
  set cdStatus(TextEditingController value) {
    _$cdStatusAtom.context.conditionallyRunInAction(() {
      super.cdStatus = value;
      _$cdStatusAtom.reportChanged();
    }, _$cdStatusAtom, name: '${_$cdStatusAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_ProducaoItemControllerBase.value');

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

  final _$salvarProducaoItemAsyncAction = AsyncAction('salvarProducaoItem');

  @override
  Future salvarProducaoItem(
      {@required ProducaoItemController store,
      @required ProducaoItemListController storeProducaoItemList}) {
    return _$salvarProducaoItemAsyncAction.run(() => super.salvarProducaoItem(
        store: store, storeProducaoItemList: storeProducaoItemList));
  }

  final _$_ProducaoItemControllerBaseActionController =
      ActionController(name: '_ProducaoItemControllerBase');

  @override
  void increment() {
    final _$actionInfo =
        _$_ProducaoItemControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_ProducaoItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
