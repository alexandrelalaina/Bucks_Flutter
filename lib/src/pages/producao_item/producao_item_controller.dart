import 'package:bucks/src/DAO/producao_item_dao.dart';
import 'package:bucks/src/pages/producao_item/producao_item_list/producao_item_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../classes/producao_item.dart';

part 'producao_item_controller.g.dart';

class ProducaoItemController = _ProducaoItemControllerBase
    with _$ProducaoItemController;

abstract class _ProducaoItemControllerBase with Store {
  ProducaoItemDAO producaoItemDAO;

  //@observable
  //List<ItemTipo> itensTipo = [];

  //@observable
  //TextEditingController seq = TextEditingController();
  @observable
  TextEditingController cdTipoEntSai = TextEditingController();
  @observable
  TextEditingController qt = TextEditingController();
  @observable
  TextEditingController vlUnit = TextEditingController();
  @observable
  TextEditingController cdStatus = TextEditingController();

  _ProducaoItemControllerBase() {
    producaoItemDAO = producaoItemDAO ?? ProducaoItemDAO();
  }

  Future init() async {}

  @action
  salvarProducaoItem(
      {@required ProducaoItemController store,
      @required ProducaoItemListController storeProducaoItemList}) async {


      ProducaoItem producaoItem = ProducaoItem();
      producaoItem.fkProducaoId = storeProducaoItemList.producao.id;
      // store.tecSeq.text,
      producaoItem.fkItemId = storeProducaoItemList.item.id;
      producaoItem.qt = store.qt.text as double;
      producaoItem.vlUnit = store.vlUnit.text as double;
      producaoItem.cdTipo = store.cdTipoEntSai.text;
      producaoItem.cdStatus = store.cdStatus.text;

    await producaoItemDAO.salvar(producaoItem);

    await storeProducaoItemList.listarProducaoItens();
  }

}
