import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'item_tipo_list/item_tipo_list_controller.dart';

part 'item_tipo_controller.g.dart';

class ItemTipoController = _ItemTipoControllerBase with _$ItemTipoController;

abstract class _ItemTipoControllerBase with Store {
  BucksDBRepository service;

  @observable
  TextEditingController descricao = TextEditingController();

  _ItemTipoControllerBase() {
    service = service ?? BucksDBRepository();
  }

  @action
  salvarItemTipo(
      {@required ItemTipoController store,
       @required ItemTipoListController storeItemTipoList}) async {
    await service.inserirItemTipo(store: store);
    await storeItemTipoList.listarItensTipo();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
