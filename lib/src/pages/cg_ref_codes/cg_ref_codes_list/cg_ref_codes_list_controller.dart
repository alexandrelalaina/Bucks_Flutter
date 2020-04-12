import 'package:bucks/src/classes/cgRefCodes.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:bucks/src/utils/constants.dart';
import 'package:mobx/mobx.dart';

part 'cg_ref_codes_list_controller.g.dart';

class CgRefCodesListController = _CgRefCodesListControllerBase
    with _$CgRefCodesListController;

abstract class _CgRefCodesListControllerBase with Store {
  BucksDBRepository service;
  @observable
  List<CgRefCodes> regList = [];

  _CgRefCodesListControllerBase() {
    service = service ?? BucksDBRepository();
  }

  void init() async {
    await listar();
  }

  @action
  Future<List<CgRefCodes>> listar() async {
    var qtdLinhas = await service.listarQuantidadeLinhas(table_name_cg_ref_codes);
    print('qtdLinhas => $qtdLinhas');
    regList = [];
    var future = service.listarCgRefCodes();
    regListObs = ObservableFuture<List<CgRefCodes>>(future);
    return regList = await future;
  }

  @computed
  bool get hasResultsCgRefCodes =>
      regListObs != emptyResponseCgRefCodes &&
      regListObs.status == FutureStatus.fulfilled;

  static ObservableFuture<List<CgRefCodes>> emptyResponseCgRefCodes =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<CgRefCodes>> regListObs = emptyResponseCgRefCodes;
}
