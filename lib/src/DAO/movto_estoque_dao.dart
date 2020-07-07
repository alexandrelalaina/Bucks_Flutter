import 'package:bucks/src/DAO/item_estoque_dao.dart';
import 'package:bucks/src/DAO/movto_estoque_tipo.dart';
import 'package:bucks/src/classes/item_estoque.dart';
import 'package:bucks/src/classes/movto_estoque.dart';
import 'package:bucks/src/classes/movto_estoque_tipo.dart';
import 'package:bucks/src/shared/utils/constants.dart';

import 'base_dao.dart';

class MovtoEstoqueDAO extends BaseDAO<MovtoEstoque> {
  @override
  MovtoEstoque fromJson(Map<String, dynamic> map) {
    return MovtoEstoque.fromJson(map);
  }

  @override
  String get sqlComJoin =>
      'select m.* ' +
      ' , mt.descr as fk_movto_estoque_tipo_descr '
          ' , i.descr  as fk_item_estoque_item_descr '
          'from $table_name_movto_estoque m '
          ' , $table_name_movto_estoque_tipo mt '
          // ' , $table_name_item_estoque ie '
          ' , $table_name_item i '
          'where m.fk_movto_estoque_tipo_id = mt.id ' +
      // TODO voltar a trabalhar para fazer o join entre de movtoEstoque para ItemEstoque...
      // tirei pq ainda nao tenho o lote corretamente
      // ' and m.fk_item_estoque_item_id  = ie.fk_item_id ' +
      // ' and m.fk_item_estoque_lote     = ie.lote ' +
      // ' and ie.fk_item_id               = i.id ';
      ' and m.fk_item_estoque_item_id = i.id ';

  @override
  String get tableName => table_name_movto_estoque;

  @override
  String get orderByCols => ' m.id desc ';

  @override
  Future<int> salvar(MovtoEstoque movtoEstoque) async {
    // chamar o metodo SALVAR do pai, normal
    print('<<< MovtoEstoqueDAO.salvar 010 => salvando o MovtoEstoque >>>');
    var _newMovtoId = super.salvar(movtoEstoque);
    movtoEstoque.id = await _newMovtoId;
    print(
        '<<< MovtoEstoqueDAO.salvar 011 => salvou movtoEstoque - _newMovtoId:$_newMovtoId >>>');
    print(
        '<<< MovtoEstoqueDAO.salvar 012 => salvou movtoEstoque - objeto movtoEstoque.id:$movtoEstoque.id >>>');
    //

    // efetuar a Baixa
    // TODO criar um metodo de baixa, onde passo
    ItemEstoqueDAO itemEstoqueDAO = ItemEstoqueDAO();
    ItemEstoque itemEstoque = ItemEstoque();
    MovtoEstoqueTipoDAO movtoEstoqueTipoDAO = MovtoEstoqueTipoDAO();
    MovtoEstoqueTipo movtoEstoqueTipo = MovtoEstoqueTipo();

    movtoEstoqueTipo = await movtoEstoqueTipoDAO
        .consultarPorPk(movtoEstoque.fkMovtoEstoqueTipoId);
    if (movtoEstoqueTipo.cdTipoMovto == 'E') {
      // Entrada = criar novo Lote
      // TODO ajustar para verificar o cd controla estoque
      print('<<< MovtoEstoqueDAO.salvar 020 => fazenda a baixa ENTRADA >>>');
      itemEstoque.fkItemId = movtoEstoque.fkItemEstoqueItemId;
      itemEstoque.qtSaldo = movtoEstoque.qtd;
      itemEstoque.vlUnit = movtoEstoque.vlUnit;
      itemEstoque.qtReservado = 0;
      print(
          '<<< MovtoEstoqueDAO.salvar 021 => fazenda a baixa SAIDA - itemEstoqueDAO.salvar(itemEstoque); >>>');
      itemEstoqueDAO.salvar(itemEstoque);

      movtoEstoque.vlUnitAnt = 0;
      movtoEstoque.vlUnitPos = movtoEstoque.vlUnit;
      movtoEstoque.qtSaldoAnt = 0;
      movtoEstoque.qtSaldoPos = movtoEstoque.qtd;
      print(
          '<<< MovtoEstoqueDAO.salvar 022 => fazenda a baixa SAIDA - super.salvar(movtoEstoque); >>>');
      super.salvar(movtoEstoque);
    } else {
      print('<<< MovtoEstoqueDAO.salvar 030 => fazenda a baixa SAIDA >>>');
      // encotrar ItemEstoque do Lote
      itemEstoque = await itemEstoqueDAO.findItemLote(
          movtoEstoque.fkItemEstoqueItemId, movtoEstoque.fkItemEstoqueLote);

      // movtoEstoque, atualizar info
      movtoEstoque.vlUnitAnt = itemEstoque.vlUnit;
      movtoEstoque.vlUnitPos = itemEstoque.vlUnit;
      movtoEstoque.qtSaldoAnt = itemEstoque.qtSaldo;

      // itemEstoque
      itemEstoque.qtSaldo = itemEstoque.qtSaldo - movtoEstoque.qtd;
      itemEstoque.qtReservado = itemEstoque.qtReservado - movtoEstoque.qtd;
      print(
          '<<< MovtoEstoqueDAO.salvar 031 => fazenda a baixa SAIDA - itemEstoqueDAO.salvar(itemEstoque); >>>');
      itemEstoqueDAO.salvar(itemEstoque);

      movtoEstoque.qtSaldoPos = itemEstoque.qtSaldo;

      print(
          '<<< MovtoEstoqueDAO.salvar 032 => fazenda a baixa SAIDA - super.salvar(movtoEstoque); >>>');
      super.salvar(movtoEstoque);
    }

    print('<<< MovtoEstoqueDAO.salvar 999 => fazenda a baixa SAIDA >>>');
    return 1;
  }
}
