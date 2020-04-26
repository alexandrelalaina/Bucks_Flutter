import 'package:bucks/src/classes/item.dart';
import 'package:bucks/src/classes/producao.dart';
import 'package:bucks/src/classes/producao_item.dart';
import 'package:bucks/src/repository/DAO/item_dao.dart';
import 'package:bucks/src/repository/DAO/producao_dao.dart';
import 'package:bucks/src/repository/DAO/producao_item_dao.dart';
import 'package:bucks/src/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'producao_item_list_controller.g.dart';

class ProducaoItemListController = _ProducaoItemListControllerBase
    with _$ProducaoItemListController;

abstract class _ProducaoItemListControllerBase with Store {

  ItemDAO itemDAO;
  ProducaoDAO producaoDAO;
  ProducaoItemDAO producaoItemDAO;
  
  @observable
  List<ProducaoItem> producaoItens = [];

  List<Producao> producoes = [];
  List<Item> itens = [];

  @observable
  ProducaoItem producaoItem;

  @observable
  Item item;

  @observable
  Producao producao;

  _ProducaoItemListControllerBase() {
    itemDAO = itemDAO ?? ItemDAO();
    producaoDAO = producaoDAO ?? ProducaoDAO();
    producaoItemDAO = producaoItemDAO ?? ProducaoItemDAO();
  }

  void init() async {
    await listarProducaoItens();
    await fetchItem();
    await fetchProducao();
  }

  @action
  Future<List<Item>> fetchItem() async {
    itens = [];
    var future = itemDAO.listarTodos();
    itensList = ObservableFuture<List<Item>>(future);
    return itens = await future;
  }

  @action
  Future<List<Producao>> fetchProducao() async {
    producoes = [];
    var future = producaoDAO.listarTodos();
    producaoList = ObservableFuture<List<Producao>>(future);
    return producoes = await future;
  }

  @action
  Future<List<ProducaoItem>> listarProducaoItens() async {
    var qtdLinhas = await producaoItemDAO.count();
    print('qtdLinhas => $qtdLinhas');
    producaoItens = [];
    var future = producaoItemDAO.listarProducaoItem2();
    producaoItemList = ObservableFuture<List<ProducaoItem>>(future);
    return producaoItens = await future;
  }

  @action
  Future<String> validateDropDowns() async {
    if (item == null || producao == null) {
      return "Existem campos que faltam ser preenchidos !";
    }

    return "";
  }

  Future<List<ProducaoItem>> filteredListProducaoItens(String item) async {
    List<ProducaoItem> listAux = [];

    if (item != "") {
      producaoItens.forEach((v) {
        if (v.seq.toString().toUpperCase().contains(item.toUpperCase()) ||
            v.descrProducao
                .toString()
                .toUpperCase()
                .contains(item.toUpperCase()) ||
            v.descrItem.toString().contains(item)) listAux.add(v);
      });
    }
    if (listAux.isEmpty)
      return producaoItens;
    else
      return listAux;
  }

  @action
  Future setItem(Item model) async {
    item = model;
  }

  @action
  Future setProducao(Producao model) async {
    producao = model;
  }

  Future<List<Producao>> filteredListProducao(String item) async {
    List<Producao> listAux = [];

    if (item != "") {
      producoes.forEach((v) {
        if (v.id.toString().toUpperCase().contains(item.toUpperCase()) ||
            v.descr.toString().contains(item)) listAux.add(v);
      });
    }
    if (listAux.isEmpty)
      return producoes;
    else
      return listAux;
  }

  Future<List<Item>> filteredListItens(String item) async {
    List<Item> listAux = [];

    if (item != "") {
      itens.forEach((v) {
        if (v.id.toString().toUpperCase().contains(item.toUpperCase()) ||
            v.descr.toString().contains(item)) listAux.add(v);
      });
    }
    if (listAux.isEmpty)
      return itens;
    else
      return listAux;
  }

  @computed
  bool get hasResultsProducaoItem =>
      producaoItemList != emptyResponseProducaoItem &&
      producaoItemList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<ProducaoItem>> emptyResponseProducaoItem =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ProducaoItem>> producaoItemList =
      emptyResponseProducaoItem;

  @computed
  bool get hasResultsItem =>
      itensList != emptyResponseItens &&
      itensList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<Item>> emptyResponseItens =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Item>> itensList = emptyResponseItens;

  @computed
  bool get hasResultsProducao =>
      producaoList != emptyResponseProducao &&
      producaoList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<Producao>> emptyResponseProducao =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Producao>> producaoList = emptyResponseProducao;
}
