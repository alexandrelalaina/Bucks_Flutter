import 'package:bucks/src/pages/item_grupo/item_grupo_list/item_grupo_list_controller.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:bucks/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'item_grupo_controller.g.dart';

class ItemGrupoController = _ItemGrupoControllerBase with _$ItemGrupoController;

abstract class _ItemGrupoControllerBase with Store {
  BucksDBRepository service;

  @observable
  TextEditingController descricao = TextEditingController();

  _ItemGrupoControllerBase() {
    service = service ?? BucksDBRepository();
  }

  @action
  salvarFarmacia(
      {@required ItemGrupoController store,
      @required ItemGrupoListController storeItemGrupoList}) async {
    await service.inserirItemGrupo(store: store);
    await storeItemGrupoList.listarItensGrupo();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
