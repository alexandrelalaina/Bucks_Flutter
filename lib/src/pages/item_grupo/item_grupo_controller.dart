import 'package:bucks/src/DAO/item_grupo_dao.dart';
import 'package:bucks/src/classes/item_grupo.dart';
import 'package:bucks/src/pages/item_grupo/item_grupo_list/item_grupo_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'item_grupo_controller.g.dart';

class ItemGrupoController = _ItemGrupoControllerBase with _$ItemGrupoController;

abstract class _ItemGrupoControllerBase with Store {
  ItemGrupoDAO itemGrupoDAO;

  @observable
  TextEditingController descr = TextEditingController();

  _ItemGrupoControllerBase() {
    itemGrupoDAO = itemGrupoDAO ?? ItemGrupoDAO();
  }

  @action
  salvar(
      {@required ItemGrupoController store,
      @required ItemGrupoListController storeItemGrupoList}) async {

    ItemGrupo itemGrupo = ItemGrupo();
    itemGrupo.descr = store.descr.text;

    await itemGrupoDAO.salvar(itemGrupo);
    await storeItemGrupoList.listarItensGrupo();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
