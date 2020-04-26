import 'package:bucks/src/DAO/producao_dao.dart';
import 'package:bucks/src/classes/producao.dart';
import 'package:bucks/src/pages/producao/producao_list/producao_list_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'producao_controller.g.dart';

class ProducaoController = _ProducaoControllerBase with _$ProducaoController;

abstract class _ProducaoControllerBase with Store {
  ProducaoDAO producaoDAO;

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
    producaoDAO = producaoDAO ?? ProducaoDAO();
  }

  @action
  Future init() async {
    //descr.text = "rla";
  }

  @action
  salvar(
      {@required ProducaoController store,
      @required ProducaoListController storeProducaoList}) async {

    Producao producao = Producao();
    producao.descr = store.descr.text;
    
    producao.fkProducaoTipoId = 1; // TODO
    // ajustar aqui store.fkProducaoTipoId.text;

    producao.dtProducaoIni = store.dtProducaoIni.text;
    producao.dtProducaoFim = store.dtProducaoFim.text;
    producao.cdStatus = store.cdStatus.text;

    await producaoDAO.salvar(producao);

    await storeProducaoList.listar();
  }
}
