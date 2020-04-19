import 'package:bucks/src/classes/Item_unmed.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:bucks/src/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'item_unmed_list_controller.g.dart';

class ItemUnMedListController = _ItemUnMedListControllerBase
    with _$ItemUnMedListController;

abstract class _ItemUnMedListControllerBase with Store {
  BucksDBRepository service;
  @observable
  List<ItemUnMed> itensUnMed = [];

  _ItemUnMedListControllerBase() {
    service = service ?? BucksDBRepository();
  }

  void init() async {
    await listar();
  }

  @action
  Future<List<ItemUnMed>> listar() async {
    var qtdLinhas = await service.listarQuantidadeLinhas(table_name_item_unmed);
    print('qtdLinhas => $qtdLinhas');
    itensUnMed = [];
    var future = service.listarItemUnMed();
    itensUnMedList = ObservableFuture<List<ItemUnMed>>(future);
    return itensUnMed = await future;
  }

  @computed
  bool get hasResultsItensUnMed =>
      itensUnMedList != emptyResponseItensUnMed &&
      itensUnMedList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<ItemUnMed>> emptyResponseItensUnMed =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ItemUnMed>> itensUnMedList = emptyResponseItensUnMed;
}
