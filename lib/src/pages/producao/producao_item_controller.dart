import 'package:bucks/src/pages/producao/producao_list/producao_item_list_controller.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'producao_item_controller.g.dart';

class ProducaoItemController = _ProducaoItemControllerBase with _$ProducaoItemController;

abstract class _ProducaoItemControllerBase with Store {
  BucksDBRepository service;

  @observable
  TextEditingController tecFkProducaoId = TextEditingController();
  TextEditingController tecSeq = TextEditingController();
  TextEditingController tecFkItemId = TextEditingController();
  TextEditingController tecQt = TextEditingController();
  TextEditingController tecVlUnit = TextEditingController();
  TextEditingController tecCdTipo = TextEditingController();
  TextEditingController tecCdStatus = TextEditingController();

  _ProducaoItemControllerBase() {
    service = service ?? BucksDBRepository();
  }

  @action
  salvar(
      {@required ProducaoItemController store,
       @required ProducaoItemListController storeProducaoItemList}) async {
    await service.inserirProducaoItem(store: store);
    await storeProducaoItemList.listar(int.parse(store.tecFkProducaoId.text));

  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
