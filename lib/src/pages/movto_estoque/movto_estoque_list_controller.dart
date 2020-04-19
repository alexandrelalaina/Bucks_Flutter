import 'package:bucks/src/classes/movto_estoque.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:bucks/src/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'movto_estoque_list_controller.g.dart';

class MovtoEstoqueListController = _MovtoEstoqueListControllerBase
    with _$MovtoEstoqueListController;

abstract class _MovtoEstoqueListControllerBase with Store {
  BucksDBRepository service;
  @observable
  List<MovtoEstoque> movtosEstoque = [];

  _MovtoEstoqueListControllerBase() {
    service = service ?? BucksDBRepository();
  }

  void init() async {
    await listar();
  }

  @action
  Future<List<MovtoEstoque>> listar() async {
    var qtdLinhas = await service.listarQuantidadeLinhas(table_name_movto_estoque);
    print('qtdLinhas => $qtdLinhas');

    // pause
    // if (qtdLinhas == 0){
      print(" --- carga manual MOVTO_ESTOQUE");
      MovtoEstoque insMovtoEstoque = MovtoEstoque();
      insMovtoEstoque.fkItemEstoqueItemId = 1;
      insMovtoEstoque.fkItemEstoqueLote = 1;
      insMovtoEstoque.fkMovtoEstoqueTipoId = 1;
      insMovtoEstoque.dt = '01/01/2020';
      insMovtoEstoque.qtd = 1.00;
      insMovtoEstoque.vlUnit = 10.00;
      insMovtoEstoque.qtSaldoAnt = 0.00;
      insMovtoEstoque.qtSaldoPos = 1.00;
      insMovtoEstoque.vlUnitAnt = 0.00;
      insMovtoEstoque.vlUnitPos = 10.00;
      insMovtoEstoque.fkProditemProducaoId = 1;
      insMovtoEstoque.fkProditemSeq = 1;

      var id = service.inserirMovtoEstoque(insMovtoEstoque);
      print('id: $id');

    // }

    movtosEstoque = [];
    var future = service.listarMovtoEstoque();
    movtosEstoqueList = ObservableFuture<List<MovtoEstoque>>(future);
    return movtosEstoque = await future;
  }

  @computed
  bool get hasResults =>
      movtosEstoqueList != emptyResponseMovtoEstoque &&
      movtosEstoqueList.status == FutureStatus.fulfilled;

  static ObservableFuture<List<MovtoEstoque>> emptyResponseMovtoEstoque =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<MovtoEstoque>> movtosEstoqueList = emptyResponseMovtoEstoque;
}
