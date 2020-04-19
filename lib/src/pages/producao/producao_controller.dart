import 'package:bucks/src/pages/producao/producao_list/producao_list_controller.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'producao_controller.g.dart';

class ProducaoController = _ProducaoControllerBase with _$ProducaoController;

abstract class _ProducaoControllerBase with Store {
  BucksDBRepository service;

  @observable
  TextEditingController id = TextEditingController();
  @observable
  TextEditingController descr = TextEditingController();
  @observable
  TextEditingController fkProducaoTipoId = TextEditingController();
  @observable
  TextEditingController dtProducaoIni = TextEditingController();
  @observable
  TextEditingController dtProducaoFim = TextEditingController();
  @observable
  TextEditingController cdStatus = TextEditingController();

  _ProducaoControllerBase() {
    service = service ?? BucksDBRepository();
  }

  @action
  Future init() async {}

  @action
  salvar(
      {@required ProducaoController store,
      @required ProducaoListController storeProducaoList}) async {
    await service.inserirProducao(store: store);
    await storeProducaoList.listar();
  }
}
