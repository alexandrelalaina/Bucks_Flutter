import 'package:bucks/src/DAO/item_dao.dart';
import 'package:bucks/src/DAO/movto_estoque_dao.dart';
import 'package:bucks/src/DAO/movto_estoque_tipo.dart';
import 'package:bucks/src/classes/item.dart';
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
  MovtoEstoqueTipoDAO movtoEstoqueTipoDAO;

  @observable
  List<MovtoEstoque> movtosEstoque = [];

  @observable
  Item lovItemSelected;

  @observable
  MovtoEstoqueTipo lovMovtoEstoqueTipoSelected;

  // listas = LOV
  List<Item> lovItens = [];
  List<MovtoEstoqueTipo> lovMovtoTipo = [];

  _MovtoEstoqueListControllerBase() {
    movtoEstoqueDAO = movtoEstoqueDAO ?? MovtoEstoqueDAO();
    itemDAO = itemDAO ?? ItemDAO();
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
    await fetchItem();
    await fetchMovtoTipo();
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

  // listas = LOV
  @action
  Future<List<Item>> fetchItem() async {
    lovItens = [];
    var future = itemDAO.listarTodos();
    itemList = ObservableFuture<List<Item>>(future);
    return lovItens = await future;
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
  @computed
  bool get hasResultsItem =>
      itemList != emptyResponseItem &&
      itemList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<Item>> emptyResponseItem =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Item>> itemList = emptyResponseItem;

  /////////////////////
  @action
  Future setItem(Item model) async {
    lovItemSelected = model;
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
