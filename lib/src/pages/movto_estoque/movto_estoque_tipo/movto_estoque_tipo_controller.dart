import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'movto_estoque_tipo_list/movto_estoque_tipo_list_controller.dart';

part 'movto_estoque_tipo_controller.g.dart';

class MovtoEstoqueTipoController = _MovtoEstoqueTipoControllerBase with _$MovtoEstoqueTipoController;

abstract class _MovtoEstoqueTipoControllerBase with Store {
  BucksDBRepository service;

  @observable
  TextEditingController tecId = TextEditingController();
  TextEditingController tecDescr = TextEditingController();
  TextEditingController tecCdTipoMovto = TextEditingController();

  _MovtoEstoqueTipoControllerBase() {
    service = service ?? BucksDBRepository();
  }

  @action
  salvar(
      {@required MovtoEstoqueTipoController store,
       @required MovtoEstoqueTipoListController storeMovtoEstoqueTipoList}) async {
    await service.inserirMovtoEstoqueTipo(store: store);
    await storeMovtoEstoqueTipoList.listar();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
