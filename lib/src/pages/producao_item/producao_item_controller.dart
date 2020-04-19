import 'package:bucks/src/pages/item/item_list/item_list_controller.dart';
import 'package:bucks/src/pages/producao_item/producao_item_list/producao_item_list_controller.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'producao_item_controller.g.dart';

class ProducaoItemController = _ProducaoItemControllerBase
    with _$ProducaoItemController;

abstract class _ProducaoItemControllerBase with Store {
  BucksDBRepository service;
  BucksDBRepository db;

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
    service = service ?? BucksDBRepository();
    db = BucksDBRepository.getInstance();
  }

  Future init() async {}

  @action
  salvarProducaoItem(
      {@required ProducaoItemController store,
      @required ProducaoItemListController storeProducaoItemList}) async {
    await service.inserirProducaoItem2(
        store: store,
        item: storeProducaoItemList.item,
        producao: storeProducaoItemList.producao);

    await storeProducaoItemList.listarProducaoItens();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
