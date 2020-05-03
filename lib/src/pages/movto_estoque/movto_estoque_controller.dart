import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../DAO/movto_estoque_dao.dart';
import '../../classes/movto_estoque.dart';
import 'movto_estoque_list_controller.dart';

part 'movto_estoque_controller.g.dart';

class MovtoEstoqueController = _MovtoEstoqueControllerBase
    with _$MovtoEstoqueController;

abstract class _MovtoEstoqueControllerBase with Store {
  MovtoEstoqueDAO movtoEstoqueDAO;

  //@observable
  //List<ItemTipo> itensTipo = [];

  // @observable
  // TextEditingController fkItem = TextEditingController();
  // @observable
  // TextEditingController fkMovtoEstoqueTipoS = TextEditingController();
  @observable
  TextEditingController dt = TextEditingController();
  @observable
  TextEditingController qtd = TextEditingController();
  @observable
  TextEditingController vlTotal = TextEditingController();
  @observable
  TextEditingController vlUnit = TextEditingController();

  // @action
  // String calcular() {
  //   vlUnit.text =
  //       (double.parse(vlTotal.text) / double.parse(qtd.text)).toString();
  //   return vlUnit.text;
  // }

  // TODO ajustar lote
  @observable
  TextEditingController lote = TextEditingController();

  _MovtoEstoqueControllerBase() {
    movtoEstoqueDAO = movtoEstoqueDAO ?? MovtoEstoqueDAO();
  }

  Future init() async {}

  @action
  salvar(
      {@required MovtoEstoqueController store,
      @required MovtoEstoqueListController storeMovtoEstoqueList}) async {
    MovtoEstoque movtoEstoque = MovtoEstoque();
    movtoEstoque.fkItemEstoqueItemId = storeMovtoEstoqueList.lovItemSelected.id;
    movtoEstoque.fkItemEstoqueLote =
        int.parse(store.lote.text); // TODO ALTERAR LOTE
    movtoEstoque.fkMovtoEstoqueTipoId =
        storeMovtoEstoqueList.lovMovtoEstoqueTipoSelected.id;
    movtoEstoque.dt = store.dt.text;
    movtoEstoque.qtd = double.parse(store.qtd.text);
    movtoEstoque.vlUnit = double.parse(store.vlUnit.text);

    await movtoEstoqueDAO.salvar(movtoEstoque);

    await storeMovtoEstoqueList.listar();
  }
}
