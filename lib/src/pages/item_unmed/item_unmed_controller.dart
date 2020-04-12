import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'item_unmed_list/item_unmed_list_controller.dart';

part 'item_unmed_controller.g.dart';

class ItemUnMedController = _ItemUnMedControllerBase with _$ItemUnMedController;

abstract class _ItemUnMedControllerBase with Store {
  BucksDBRepository service;

  @observable
  TextEditingController id = TextEditingController();
  TextEditingController descr = TextEditingController();

  _ItemUnMedControllerBase() {
    service = service ?? BucksDBRepository();
  }

  @action
  salvar(
      {@required ItemUnMedController store,
       @required ItemUnMedListController storeItemUnMedList}) async {
    await service.inserirItemUnMed(store: store);
    await storeItemUnMedList.listar();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
