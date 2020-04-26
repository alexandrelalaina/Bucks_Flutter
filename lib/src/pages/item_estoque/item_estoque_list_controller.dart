import 'package:bucks/src/DAO/item_estoque_dao.dart';
import 'package:bucks/src/classes/item_estoque.dart';
import 'package:mobx/mobx.dart';

part 'item_estoque_list_controller.g.dart';

class ItemEstoqueListController = _ItemEstoqueListControllerBase
    with _$ItemEstoqueListController;

abstract class _ItemEstoqueListControllerBase with Store {

  ItemEstoqueDAO itemEstoqueDAO;

  @observable
  List<ItemEstoque> itemsEstoque = [];

  _ItemEstoqueListControllerBase() {
    itemEstoqueDAO = itemEstoqueDAO ?? ItemEstoqueDAO();
  }

  void init() async {
    await findAll();
  }

  @action
  Future<List<ItemEstoque>> findAll() async {
    var qtdLinhas = await itemEstoqueDAO.count();
    print('qtdLinhas => $qtdLinhas');

    // pause
    //  if (qtdLinhas == 0){
      print(" --- carga manual ITEM_ESTOQUE");
      ItemEstoque insItemEstoque = ItemEstoque();
      insItemEstoque.fkItemId = 1;
      insItemEstoque.lote = 1;
      insItemEstoque.qtSaldo = 300.00;
      insItemEstoque.vlUnit = 30.00;
      insItemEstoque.qtReservado = 0.00;

      var id = itemEstoqueDAO.salvar(insItemEstoque);
      print('id: $id');
    //  }

    itemsEstoque = [];
    var future = itemEstoqueDAO.listarTodos();
    itemsEstoqueList = ObservableFuture<List<ItemEstoque>>(future);
    return itemsEstoque = await future;
  }

  @computed
  bool get hasResults =>
      itemsEstoqueList != emptyResponseItemEstoque &&
      itemsEstoqueList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<ItemEstoque>> emptyResponseItemEstoque =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ItemEstoque>> itemsEstoqueList = emptyResponseItemEstoque;
}
