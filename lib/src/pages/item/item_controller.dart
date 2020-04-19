import 'package:bucks/src/pages/item/item_list/item_list_controller.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'item_controller.g.dart';

class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  BucksDBRepository service;
  BucksDBRepository db;

  //@observable
  //List<ItemTipo> itensTipo = [];

  @observable
  @observable
  TextEditingController id = TextEditingController();
  TextEditingController descricao = TextEditingController();
  TextEditingController cdControlaEstoque = TextEditingController();

  _ItemControllerBase() {
    service = service ?? BucksDBRepository();
    db = BucksDBRepository.getInstance();
  }

  Future init() async {

  }

  @action
  salvarItem(
      {@required ItemController store,
      @required ItemListController storeItemList}) async {
    await service.inserirItem( store, storeItemList.itemTipo,storeItemList.itemGrupo ,storeItemList.itemUnMed);
    await storeItemList.listarItens();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
