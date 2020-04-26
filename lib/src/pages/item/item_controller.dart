import 'package:bucks/src/pages/item/item_list/item_list_controller.dart';
import 'package:bucks/src/repository/DAO/item_dao.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../classes/item.dart';

part 'item_controller.g.dart';

class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  ItemDAO itemDAO;

  //@observable
  //List<ItemTipo> itensTipo = [];

  @observable
  TextEditingController id = TextEditingController();

  @observable
  TextEditingController descricao = TextEditingController();

  @observable
  TextEditingController cdControlaEstoque = TextEditingController();

  _ItemControllerBase() {
    itemDAO = itemDAO ?? ItemDAO();
  }

  Future init() async {

  }

  @action
  salvarItem(
      {@required ItemController store,
      @required ItemListController storeItemList}) async {


    Item item = Item();
    item.descr = store.descricao.text;
    item.cdControlaEstoque = store.cdControlaEstoque.text.toUpperCase();
    item.fkItemTipoId = storeItemList.itemTipo.id;
    item.fkItemGrupoId = storeItemList.itemGrupo.id;
    item.fkItemUnmedId = storeItemList.itemUnmed.id;

    await itemDAO.salvar(item);

    await storeItemList.listarItens();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
