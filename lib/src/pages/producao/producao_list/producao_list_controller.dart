import 'package:bucks/src/classes/producao.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:bucks/src/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'producao_list_controller.g.dart';

class ProducaoListController = _ProducaoListControllerBase
    with _$ProducaoListController;

abstract class _ProducaoListControllerBase with Store {
  BucksDBRepository service;
  @observable
  List<Producao> producoes = [];

  _ProducaoListControllerBase() {
    service = service ?? BucksDBRepository();
  }

  void init() async {
    await listar();
  }

  @action
  Future<List<Producao>> listar() async {
    var qtdLinhas = await service.listarQuantidadeLinhas(table_name_producao);
    print('qtdLinhas => $qtdLinhas');
    producoes = [];
    var future = service.listarProducao();
    producoesList = ObservableFuture<List<Producao>>(future);
    return producoes = await future;
  }

  @computed
  bool get hasResultsProducao =>
      producoesList != emptyResponseProducao &&
      producoesList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<Producao>> emptyResponseProducao =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Producao>> producoesList = emptyResponseProducao;
}
