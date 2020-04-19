// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProducaoController on _ProducaoControllerBase, Store {
  final _$idAtom = Atom(name: '_ProducaoControllerBase.id');

  @override
  TextEditingController get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(TextEditingController value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$descrAtom = Atom(name: '_ProducaoControllerBase.descr');

  @override
  TextEditingController get descr {
    _$descrAtom.context.enforceReadPolicy(_$descrAtom);
    _$descrAtom.reportObserved();
    return super.descr;
  }

  @override
  set descr(TextEditingController value) {
    _$descrAtom.context.conditionallyRunInAction(() {
      super.descr = value;
      _$descrAtom.reportChanged();
    }, _$descrAtom, name: '${_$descrAtom.name}_set');
  }

  final _$fkProducaoTipoIdAtom =
      Atom(name: '_ProducaoControllerBase.fkProducaoTipoId');

  @override
  TextEditingController get fkProducaoTipoId {
    _$fkProducaoTipoIdAtom.context.enforceReadPolicy(_$fkProducaoTipoIdAtom);
    _$fkProducaoTipoIdAtom.reportObserved();
    return super.fkProducaoTipoId;
  }

  @override
  set fkProducaoTipoId(TextEditingController value) {
    _$fkProducaoTipoIdAtom.context.conditionallyRunInAction(() {
      super.fkProducaoTipoId = value;
      _$fkProducaoTipoIdAtom.reportChanged();
    }, _$fkProducaoTipoIdAtom, name: '${_$fkProducaoTipoIdAtom.name}_set');
  }

  final _$dtProducaoIniAtom =
      Atom(name: '_ProducaoControllerBase.dtProducaoIni');

  @override
  TextEditingController get dtProducaoIni {
    _$dtProducaoIniAtom.context.enforceReadPolicy(_$dtProducaoIniAtom);
    _$dtProducaoIniAtom.reportObserved();
    return super.dtProducaoIni;
  }

  @override
  set dtProducaoIni(TextEditingController value) {
    _$dtProducaoIniAtom.context.conditionallyRunInAction(() {
      super.dtProducaoIni = value;
      _$dtProducaoIniAtom.reportChanged();
    }, _$dtProducaoIniAtom, name: '${_$dtProducaoIniAtom.name}_set');
  }

  final _$dtProducaoFimAtom =
      Atom(name: '_ProducaoControllerBase.dtProducaoFim');

  @override
  TextEditingController get dtProducaoFim {
    _$dtProducaoFimAtom.context.enforceReadPolicy(_$dtProducaoFimAtom);
    _$dtProducaoFimAtom.reportObserved();
    return super.dtProducaoFim;
  }

  @override
  set dtProducaoFim(TextEditingController value) {
    _$dtProducaoFimAtom.context.conditionallyRunInAction(() {
      super.dtProducaoFim = value;
      _$dtProducaoFimAtom.reportChanged();
    }, _$dtProducaoFimAtom, name: '${_$dtProducaoFimAtom.name}_set');
  }

  final _$cdStatusAtom = Atom(name: '_ProducaoControllerBase.cdStatus');

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

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$salvarAsyncAction = AsyncAction('salvar');

  @override
  Future salvar(
      {@required ProducaoController store,
      @required ProducaoListController storeProducaoList}) {
    return _$salvarAsyncAction.run(
        () => super.salvar(store: store, storeProducaoList: storeProducaoList));
  }
}
