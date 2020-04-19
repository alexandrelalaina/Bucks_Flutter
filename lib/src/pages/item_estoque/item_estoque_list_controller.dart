import 'package:bucks/src/classes/item_estoque.dart';
import 'package:bucks/src/repository/DAO/item_estoque_dao.dart';
import 'package:mobx/mobx.dart';

part 'item_estoque_list_controller.g.dart';

class ItemEstoqueListController = _ItemEstoqueListControllerBase
    with _$ItemEstoqueListController;

abstract class _ItemEstoqueListControllerBase with Store {
  ItemEstoqueDAO service;
  // BucksDBRepository service;

  @observable
  List<ItemEstoque> itemsEstoque = [];

  _ItemEstoqueListControllerBase() {
    service = service ?? ItemEstoqueDAO();
    // service = service ?? BucksDBRepository();
  }

  void init() async {
    await findAll();
  }

  @action
  Future<List<ItemEstoque>> findAll() async {
    var qtdLinhas = await service.count();
    print('qtdLinhas => $qtdLinhas');

    // pause
    //  if (qtdLinhas == 0){
      print(" --- carga manual ITEM_ESTOQUE");
      ItemEstoque insItemEstoque = ItemEstoque();
      insItemEstoque.fkItemId = 3;
      insItemEstoque.lote = 1;
      insItemEstoque.qtSaldo = 300.00;
      insItemEstoque.vlUnit = 30.00;
      insItemEstoque.qtReservado = 0.00;

      var id = service.save(insItemEstoque);
      print('id: $id');
    //  }

    itemsEstoque = [];
    var future = service.findAll();
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
