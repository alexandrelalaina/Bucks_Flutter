import 'package:bucks/src/classes/producaoItem.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:bucks/src/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'producao_item_list_controller.g.dart';

class ProducaoItemListController = _ProducaoItemListControllerBase
    with _$ProducaoItemListController;

abstract class _ProducaoItemListControllerBase with Store {
  BucksDBRepository service;
  @observable
  List<ProducaoItem> producaoItens = [];

  _ProducaoItemListControllerBase() {
    service = service ?? BucksDBRepository();
  }

  void init() async {
    await listar(0);
  }

  @action
  Future<List<ProducaoItem>> listar(int fkProducaoId) async {
    var qtdLinhas = await service.listarQuantidadeLinhas(table_name_producao_item);
    print('qtdLinhas => $qtdLinhas');
    producaoItens = [];
    var future = service.listarProducaoItem(fkProducaoId);
    producaoItensList = ObservableFuture<List<ProducaoItem>>(future);
    return producaoItens = await future;
  }

  @computed
  bool get hasResultsProducaoItem =>
      producaoItensList != emptyResponseProducaoItem &&
      producaoItensList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<ProducaoItem>> emptyResponseProducaoItem =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ProducaoItem>> producaoItensList = emptyResponseProducaoItem;
}
