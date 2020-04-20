import 'package:bucks/src/classes/item_estoque.dart';
import 'package:bucks/src/classes/producao.dart';
import 'package:bucks/src/classes/producao_item.dart';
import 'package:bucks/src/pages/producao/producao_controller.dart';
import 'package:bucks/src/repository/DAO/item_estoque_dao.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:bucks/src/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'producao_list_controller.g.dart';

class ProducaoListController = _ProducaoListControllerBase
    with _$ProducaoListController;

abstract class _ProducaoListControllerBase with Store {
  ItemEstoqueDAO service;
  BucksDBRepository serviceAlterar;
  ProducaoController storeProducaoController;

  @observable
  List<Producao> producoes = [];

  @observable
  List<ProducaoItem> producaoItensDt = [];

  @observable
  List<ItemEstoque> itemsEstoque = [];

  @observable
  List<Producao> ultProdInserida = [];

  @observable
  ItemEstoque itemEstoque;

  @observable
  ProducaoItem producaoItem;

  @observable
  Producao producao;

  _ProducaoListControllerBase() {
    service = service ?? ItemEstoqueDAO();
    serviceAlterar = serviceAlterar ?? BucksDBRepository();
  }

  void init() async {
    await listar();
    await listarItemEstoque();
  }

  @action
  Future<List<ItemEstoque>> listarItemEstoque() async {
    itemsEstoque = [];
    var future = service.listarItemEstoque();
    itemEstoqueList = ObservableFuture<List<ItemEstoque>>(future);
    itemsEstoque = await future;
    return itemsEstoque;
  }

  @action
  Future<List<Producao>> listarProducaoByDescr(String descr) async {
    ultProdInserida = [];
    var future = serviceAlterar.listarProducaoByDescr(descr: descr);
    //itemEstoqueList = ObservableFuture<List<Producao>>(future);
    ultProdInserida = await future;
    return ultProdInserida;
  }

  @action
  Future setLixo() async {
    null;
  }

  @action
  Future setProducao(ItemEstoque model, String descrUltProdInserida) async {
    print(descrUltProdInserida);
    await listarProducaoByDescr(descrUltProdInserida);

    var idProd;
    var nomeProd;
    for (var prod in ultProdInserida) {
      print(ultProdInserida.last.id);
      print(ultProdInserida.last.descr);
      idProd = ultProdInserida.last.id;
      nomeProd = ultProdInserida.last.descr;
    }

    var seqProdItem;
    for (var prodItens in producaoItensDt) {
      seqProdItem = prodItens.seq + 1;
    }

    if (seqProdItem == null) {
      seqProdItem = 1;
    }

    ProducaoItem pi = new ProducaoItem(seqProdItem, idProd, model.fkItemId, 100,
        null, null, null, model.descrItem, nomeProd);

    producaoItensDt = producaoItensDt;
    producaoItensDt.add(pi);
  }

  @action
  Future<List<Producao>> listar() async {
    var qtdLinhas =
        await serviceAlterar.listarQuantidadeLinhas(table_name_producao);
    print('qtdLinhas => $qtdLinhas');
    producoes = [];
    var future = serviceAlterar.listarProducao();
    producoesList = ObservableFuture<List<Producao>>(future);
    return producoes = await future;
  }

  @action
  removeitemsDataTable(ProducaoItem data) async {
    producaoItensDt = producaoItensDt;
    producaoItensDt.remove(data);
  }

  @action
  bool validaDataTablePossuiItem(String descrItem) {
    bool possuiItemDataTable = false;

    producaoItensDt.forEach((v1) {
      if (v1.descrItem == descrItem) {
        possuiItemDataTable = true;
      }
    });

    return possuiItemDataTable;
  }

  //@computed
  //bool get hasResultsProducaoItensDt => itemProducaoDtList   != [];

  Future<List<ItemEstoque>> filteredListItemEstoque(String item) async {
    List<ItemEstoque> listAux = [];

    if (item != "") {
      itemsEstoque.forEach((v) {
        if (v.fkItemId.toString().toUpperCase().contains(item.toUpperCase()) ||
            v.descrItem.toString().contains(item)) listAux.add(v);
      });
    }
    if (listAux.isEmpty)
      return itemsEstoque;
    else
      return listAux;
  }

  @computed
  bool get hasResultsProducao =>
      producoesList != emptyResponseProducao &&
      producoesList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<Producao>> emptyResponseProducao =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Producao>> producoesList = emptyResponseProducao;

  @observable
  ObservableFuture<List<ProducaoItem>> producaoItemListDt =
      emptyResponseProducaoItem;

  @computed
  bool get hasResultsProducaoItemDt =>
      producaoItemListDt != emptyResponseProducaoItemDt &&
      producaoItemListDt.status == FutureStatus.fulfilled;

  static ObservableFuture<List<ProducaoItem>> emptyResponseProducaoItemDt =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ProducaoItem>> producaoItemList =
      emptyResponseProducaoItem;

  @computed
  bool get hasResultsProducaoItem =>
      producaoItemList != emptyResponseProducaoItem &&
      producaoItemList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<ProducaoItem>> emptyResponseProducaoItem =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ItemEstoque>> itemEstoqueList =
      emptyResponseItemEstoque;

  @computed
  bool get hasResultsItemEstoque =>
      itemEstoqueList != emptyResponseItemEstoque &&
      itemEstoqueList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<ItemEstoque>> emptyResponseItemEstoque =
      ObservableFuture.value([]);
}
