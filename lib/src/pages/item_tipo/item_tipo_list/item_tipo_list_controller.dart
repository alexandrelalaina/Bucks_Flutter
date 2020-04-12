import 'package:bucks/src/classes/ItemTipo.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:bucks/src/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'item_tipo_list_controller.g.dart';

class ItemTipoListController = _ItemTipoListControllerBase
    with _$ItemTipoListController;

abstract class _ItemTipoListControllerBase with Store {
  BucksDBRepository service;
  @observable
  List<ItemTipo> itensTipo = [];

  _ItemTipoListControllerBase() {
    service = service ?? BucksDBRepository();
  }

  void init() async {
    await listarItensTipo();
  }

  @action
  Future<List<ItemTipo>> listarItensTipo() async {
    var qtdLinhas = await service.listarQuantidadeLinhas(table_name_item_tipo);
    print('qtdLinhas => $qtdLinhas');
    itensTipo = [];
    var future = service.listarItemTipo();
    itensTipoList = ObservableFuture<List<ItemTipo>>(future);
    return itensTipo = await future;
  }

  @computed
  bool get hasResultsItensTipo =>
      itensTipoList != emptyResponseItensTipo &&
      itensTipoList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<ItemTipo>> emptyResponseItensTipo =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ItemTipo>> itensTipoList = emptyResponseItensTipo;
}
