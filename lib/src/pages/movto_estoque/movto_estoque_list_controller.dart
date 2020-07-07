import 'package:bucks/src/DAO/item_dao.dart';
import 'package:bucks/src/DAO/item_estoque_dao.dart';
import 'package:bucks/src/DAO/movto_estoque_dao.dart';
import 'package:bucks/src/DAO/movto_estoque_tipo.dart';
import 'package:bucks/src/classes/item.dart';
import 'package:bucks/src/classes/item_estoque.dart';
import 'package:bucks/src/classes/movto_estoque.dart';
import 'package:bucks/src/classes/movto_estoque_tipo.dart';
import 'package:mobx/mobx.dart';

part 'movto_estoque_list_controller.g.dart';

class MovtoEstoqueListController = _MovtoEstoqueListControllerBase
    with _$MovtoEstoqueListController;

abstract class _MovtoEstoqueListControllerBase with Store {
  MovtoEstoqueDAO movtoEstoqueDAO;

  //listas = LOV
  ItemDAO itemDAO;
  ItemEstoqueDAO itemEstoqueDAO;
  MovtoEstoqueTipoDAO movtoEstoqueTipoDAO;

  @observable
  List<MovtoEstoque> movtosEstoque = [];

  @observable
  Item lovItemSelected;

  @observable
  ItemEstoque lovItemEstoqueSelected;

  @observable
  MovtoEstoqueTipo lovMovtoEstoqueTipoSelected;

  // listas = LOV
  List<Item> lovItens = [];
  List<ItemEstoque> lovItensEstoque = [];
  List<MovtoEstoqueTipo> lovMovtoTipo = [];

  _MovtoEstoqueListControllerBase() {
    movtoEstoqueDAO = movtoEstoqueDAO ?? MovtoEstoqueDAO();
    itemDAO = itemDAO ?? ItemDAO();
    itemEstoqueDAO = itemEstoqueDAO ?? ItemEstoqueDAO();
    movtoEstoqueTipoDAO = movtoEstoqueTipoDAO ?? MovtoEstoqueTipoDAO();
  }

  @action
  Future<String> validateDropDowns() async {
    // if (dt == null || producao == null) {
    //   return "Existem campos que faltam ser preenchidos !";
    // }

    return "";
  }

  void init() async {
    await listar();
    await fetchMovtoTipo();
    // await fetchItem();
    // await fetchItemEstoque();
  }

  @action
  Future<List<MovtoEstoque>> listar() async {
    var qtdLinhas = await movtoEstoqueDAO.count();
    print('qtdLinhas => $qtdLinhas');

    // pause
    // if (qtdLinhas == 0) {
    //   print(" --- carga manual MOVTO_ESTOQUE");
    //   MovtoEstoque insMovtoEstoque = MovtoEstoque();
    //   insMovtoEstoque.fkItemEstoqueItemId = 1;
    //   insMovtoEstoque.fkItemEstoqueLote = 1;
    //   insMovtoEstoque.fkMovtoEstoqueTipoId = 1;
    //   insMovtoEstoque.dt = '01/01/2020';
    //   insMovtoEstoque.qtd = 1.00;
    //   insMovtoEstoque.vlUnit = 10.00;
    //   insMovtoEstoque.qtSaldoAnt = 0.00;
    //   insMovtoEstoque.qtSaldoPos = 1.00;
    //   insMovtoEstoque.vlUnitAnt = 0.00;
    //   insMovtoEstoque.vlUnitPos = 10.00;
    //   // insMovtoEstoque.fkProditemMovtoEstoqueId = 1;
    //   insMovtoEstoque.fkProditemSeq = 1;

    //   var id = movtoEstoqueDAO.salvar(insMovtoEstoque);
    //   print('id: $id');
    // }

    movtosEstoque = [];
    var future = movtoEstoqueDAO.listarTodos();
    movtosEstoqueList = ObservableFuture<List<MovtoEstoque>>(future);
    return movtosEstoque = await future;
  }

  Future<List<MovtoEstoque>> filteredListMovtoEstoque(String item) async {
    List<MovtoEstoque> listAux = [];

    if (item != "") {
      movtosEstoque.forEach((v) {
        if (v.id.toString().contains(item.toUpperCase())) listAux.add(v);
      });
    }
    if (listAux.isEmpty)
      return movtosEstoque;
    else
      return listAux;
  }

  Future<List<Item>> filteredListItens(String item) async {
    List<Item> listAux = [];

    if (item != "") {
      lovItens.forEach((v) {
        if (v.id.toString().toUpperCase().contains(item.toUpperCase()))
          listAux.add(v);
      });
    }
    if (listAux.isEmpty)
      return lovItens;
    else
      return listAux;
  }

  Future<List<ItemEstoque>> filteredListItensEstoque(String item) async {
    List<ItemEstoque> listAux = [];

    if (item != "") {
      lovItensEstoque.forEach((v) {
        // TODO ver se precisarei trabalhar com o LOTE
        if (v.fkItemId.toString().toUpperCase().contains(item.toUpperCase()))
          listAux.add(v);
      });
    }
    if (listAux.isEmpty)
      return lovItensEstoque;
    else
      return listAux;
  }

  Future<List<MovtoEstoqueTipo>> filteredListMovtoEstoqueTipo(
      String item) async {
    List<MovtoEstoqueTipo> listAux = [];

    if (item != "") {
      lovMovtoTipo.forEach((v) {
        if (v.id.toString().toUpperCase().contains(item.toUpperCase()))
          listAux.add(v);
      });
    }
    if (listAux.isEmpty)
      return lovMovtoTipo;
    else
      return listAux;
  }

  /////////////////////
  @computed
  bool get hasResults =>
      movtosEstoqueList != emptyResponseMovtoEstoque &&
      movtosEstoqueList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<MovtoEstoque>> emptyResponseMovtoEstoque =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<MovtoEstoque>> movtosEstoqueList =
      emptyResponseMovtoEstoque;

  ///////////////////// Item //////////////
  @computed
  bool get hasResultsItem =>
      itensList != emptyResponseItens &&
      itensList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<Item>> emptyResponseItens =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Item>> itensList = emptyResponseItens;

  ///////////////////// ItemEstoque //////////////
  @computed
  bool get hasResultsItemEstoque =>
      itensEstoqueList != emptyResponseItensEstoque &&
      itensEstoqueList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<ItemEstoque>> emptyResponseItensEstoque =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ItemEstoque>> itensEstoqueList =
      emptyResponseItensEstoque;

  // listas = LOV
  @action
  Future<List<Item>> fetchItem() async {
    lovItens = [];
    var future = itemDAO.listarTodos();
    itensList = ObservableFuture<List<Item>>(future);
    return lovItens = await future;
  }

  // listas = LOV
  @action
  Future<List<ItemEstoque>> fetchItemEstoque() async {
    lovItensEstoque = [];
    var future = itemEstoqueDAO.lovItemEstoque();
    // var future = itemEstoqueDAO.listarTodos();
    itensEstoqueList = ObservableFuture<List<ItemEstoque>>(future);
    return lovItensEstoque = await future;
  }

  // listas = LOV
  @action
  Future<List<MovtoEstoqueTipo>> fetchMovtoTipo() async {
    lovMovtoTipo = [];
    var future = movtoEstoqueTipoDAO.listarTodos();
    movtoTipoList = ObservableFuture<List<MovtoEstoqueTipo>>(future);
    return lovMovtoTipo = await future;
  }

  /////////////////////
  @action
  Future setItem(Item model) async {
    lovItemSelected = model;
  }

  /////////////////////
  @action
  Future setItemEstoque(ItemEstoque model) async {
    lovItemEstoqueSelected = model;
  }

  /////////////////////
  @computed
  bool get hasResultsMovtoTipo =>
      movtoTipoList != emptyResponseMovtoTipo &&
      movtoTipoList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<MovtoEstoqueTipo>> emptyResponseMovtoTipo =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<MovtoEstoqueTipo>> movtoTipoList =
      emptyResponseMovtoTipo;

  /////////////////////
  @action
  Future setMovtoEstoqueTipo(MovtoEstoqueTipo model) async {
    lovMovtoEstoqueTipoSelected = model;
  }
}
