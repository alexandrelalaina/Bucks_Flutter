import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'cg_ref_codes_list/cg_ref_codes_list_controller.dart';

part 'cg_ref_codes_controller.g.dart';

class CgRefCodesController = _CgRefCodesControllerBase with _$CgRefCodesController;

abstract class _CgRefCodesControllerBase with Store {
  BucksDBRepository service;

  @observable
  TextEditingController id = TextEditingController();
  TextEditingController rvDomain = TextEditingController();
  TextEditingController rvLowValue = TextEditingController();
  TextEditingController rvHighValue = TextEditingController();
  TextEditingController rvDescr = TextEditingController();
  TextEditingController rvAbrev = TextEditingController();

  _CgRefCodesControllerBase() {
    service = service ?? BucksDBRepository();
  }

  @action
  salvar(
      {@required CgRefCodesController store,
       @required CgRefCodesListController storeCgRefCodesList}) async {
    await service.inserirCgRefCodes(store: store);
    await storeCgRefCodesList.listar();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
