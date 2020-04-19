import 'package:bucks/src/classes/Item_grupo.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:bucks/src/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'item_grupo_list_controller.g.dart';

class ItemGrupoListController = _ItemGrupoListControllerBase
    with _$ItemGrupoListController;

abstract class _ItemGrupoListControllerBase with Store {
  BucksDBRepository service;
  @observable
  List<ItemGrupo> itensGrupo = [];

  _ItemGrupoListControllerBase() {
    service = service ?? BucksDBRepository();
  }

  void init() async {
    await listarItensGrupo();
  }

  @action
  Future<List<ItemGrupo>> listarItensGrupo() async {
    var qtdLinhas = await service.listarQuantidadeLinhas(table_name_item_grupo);
    print('qtdLinhas => $qtdLinhas');
    itensGrupo = [];
    var future = service.listarItemGrupo();
    itensGrupoList = ObservableFuture<List<ItemGrupo>>(future);
    return itensGrupo = await future;
  }

  @computed
  bool get hasResultsItensGrupo =>
      itensGrupoList != emptyResponseItensGrupo &&
      itensGrupoList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<ItemGrupo>> emptyResponseItensGrupo =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<ItemGrupo>> itensGrupoList = emptyResponseItensGrupo;
}
