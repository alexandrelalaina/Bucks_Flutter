import 'package:bucks/src/classes/item_tipo.dart';
import 'package:bucks/src/repository/DAO/item_tipo_dao.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'item_tipo_list/item_tipo_list_controller.dart';

part 'item_tipo_controller.g.dart';

class ItemTipoController = _ItemTipoControllerBase with _$ItemTipoController;

abstract class _ItemTipoControllerBase with Store {
  ItemTipoDAO itemTipoDAO;

  @observable
  TextEditingController descr = TextEditingController();

  _ItemTipoControllerBase() {
    itemTipoDAO = itemTipoDAO ?? ItemTipoDAO();
  }

  @action
  salvarItemTipo(
      {@required ItemTipoController store,
       @required ItemTipoListController storeItemTipoList}) async {

    ItemTipo itemTipo = ItemTipo();
    itemTipo.descr = store.descr.text;
    print('itemTipo.descr: $itemTipo.descr');
    await itemTipoDAO.salvar(itemTipo);

    await storeItemTipoList.listarItensTipo();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
