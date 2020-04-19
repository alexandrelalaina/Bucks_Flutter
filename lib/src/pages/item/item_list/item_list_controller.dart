import 'package:bucks/src/classes/Item_grupo.dart';
import 'package:bucks/src/classes/Item_tipo.dart';
import 'package:bucks/src/classes/Item_unmed.dart';
import 'package:bucks/src/classes/item.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:bucks/src/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'item_list_controller.g.dart';

class ItemListController = _ItemListControllerBase with _$ItemListController;

abstract class _ItemListControllerBase with Store {
  BucksDBRepository service;
  @observable
  List<Item> itens = [];

  List<ItemTipo> itensTipo = [];
  List<ItemGrupo> itensGrupo = [];
  List<ItemUnMed> itensUnMed = []; 

  @observable
  Item item;

  @observable
  ItemTipo itemTipo;

  @observable
  ItemGrupo itemGrupo;

  @observable
  ItemUnMed itemUnMed;

  _ItemListControllerBase() {
    service = service ?? BucksDBRepository();
  }

  void init() async {
    await listarItens();
    await fetchItemTipo();
    await fetchItemGrupo();
    await fetchItemUnMed();
  }

  @action
  Future<List<ItemTipo>> fetchItemTipo() async {
    itensTipo = [];
    var future = service.listarItemTipo();
    itemTipoList = ObservableFuture<List<ItemTipo>>(future);
    return itensTipo = await future;
  }

  @action
  Future<List<ItemGrupo>> fetchItemGrupo() async {
    itensGrupo = [];
    var future = service.listarItemGrupo();
    itemGrupoList = ObservableFuture<List<ItemGrupo>>(future);
    return itensGrupo = await future;
  }

  @action
  Future<List<ItemUnMed>> fetchItemUnMed() async {
    itensUnMed = [];
    var future = service.listarItemUnMed();
    itemUnMedList = ObservableFuture<List<ItemUnMed>>(future);
    return itensUnMed = await future;
  }

  @action
  Future<List<Item>> listarItens() async {
    var qtdLinhas = await service.listarQuantidadeLinhas(table_name_item);
    print('qtdLinhas => $qtdLinhas');
    itens = [];
    var future = service.listarItem();
    itensList = ObservableFuture<List<Item>>(future);
    return itens = await future;
  }

   @action
  Future<String> listarDescrItemTipo() async {
    itens = [];
    final result = service.listarDescrItemTipo();
    return result;
  }

  @action
  Future<String> validateDropDowns() async {
    if(itemTipo == null || itemGrupo == null || itemUnMed == null) {
      return "Existem campos que faltam ser preenchidos !";
    }

    return "";
  } 

  Future<List<Item>> filteredListItens(String item) async {
    List<Item> listAux = [];

    if (item != "") {
      itens.forEach((v) {
        if (v.id.toString().toUpperCase().contains(item.toUpperCase()) ||
            v.descricao.toString().contains(item)) listAux.add(v);
      });
    }
    if (listAux.isEmpty)
      return itens;
    else
      return listAux;
  }

  @action
  Future setItemTipo(ItemTipo model) async {
    itemTipo = model;
  }

  @action
  Future setItemGrupo(ItemGrupo model) async {
    itemGrupo = model;
  }

  @action
  Future setItemUnMed(ItemUnMed model) async {
    itemUnMed = model;
  }

  Future<List<ItemTipo>> filteredListItensTipos(String item) async {
    List<ItemTipo> listAux = [];

    if (item != "") {
      itensTipo.forEach((v) {
        if (v.id.toString().toUpperCase().contains(item.toUpperCase()) ||
            v.descricao.toString().contains(item)) listAux.add(v);
      });
    }
    if (listAux.isEmpty)
      return itensTipo;
    else
      return listAux;
  }

  Future<List<ItemGrupo>> filteredListItensGrupos(String item) async {
    List<ItemGrupo> listAux = [];

    if (item != "") {
      itensGrupo.forEach((v) {
        if (v.id.toString().toUpperCase().contains(item.toUpperCase()) ||
            v.descricao.toString().contains(item)) listAux.add(v);
      });
    }
    if (listAux.isEmpty)
      return itensGrupo;
    else
      return listAux;
  }

  Future<List<ItemUnMed>> filteredListItensUnMed(String item) async {
    List<ItemUnMed> listAux = [];

    if (item != "") {
      itensUnMed.forEach((v) {
        if (v.id.toString().toUpperCase().contains(item.toUpperCase()) ||
            v.descr.toString().contains(item)) listAux.add(v);
      });
    }
    if (listAux.isEmpty)
      return itensUnMed;
    else
      return listAux;
  }

  @computed
  bool get hasResultsItens =>
      itensList != emptyResponseItens &&
      itensList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<Item>> emptyResponseItens =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Item>> itensList = emptyResponseItens;

  @computed
  bool get hasResultsItemTipo =>
      itemTipoList != emptyResponseItemTipo &&
      itemTipoList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<ItemTipo>> emptyResponseItemTipo =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ItemTipo>> itemTipoList = emptyResponseItemTipo;

  @computed
  bool get hasResultsItemGrupo =>
      itemGrupoList != emptyResponseItemGrupo &&
      itemGrupoList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<ItemGrupo>> emptyResponseItemGrupo =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ItemGrupo>> itemGrupoList = emptyResponseItemGrupo;

  @computed
  bool get hasResultsItemUnMed =>
      itemUnMedList != emptyResponseItemUnMed &&
      itemUnMedList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<ItemUnMed>> emptyResponseItemUnMed =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ItemUnMed>> itemUnMedList = emptyResponseItemUnMed;
}
