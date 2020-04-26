import 'package:bucks/src/classes/item_estoque.dart';
import 'package:bucks/src/shared/utils/constants.dart';

import 'base_dao.dart';

class ItemEstoqueDAO extends BaseDAO<ItemEstoque> {

  @override
  String get tableName => table_name_item_estoque;

  @override
  ItemEstoque fromJson(Map<String, dynamic> map) {
    return ItemEstoque.fromJson(map);
  }

  @override
  String get sqlComJoin => 'select i.id      as fk_item_id '+
                               ' , i.descr   as fk_item_descr '+
                               ' , gr.id     as fk_item_grupo_id '+
                               ' , gr.descr  as fk_item_grupo_descr '+
                               ' , un.id     as fk_item_unmed_id '+
                               ' , un.descr  as fk_item_unmed_descr '+
                               ' , tp.id     as fk_item_tipo_id '+
                               ' , tp.descr  as fk_item_tipo_descr '+
                              //  ' , ie.* '+
                           'from $table_name_item i '+
                             ' , $table_name_item_grupo gr '+
                             ' , $table_name_item_unmed un '+
                             ' , $table_name_item_tipo  tp '+
                          // retirar o item estoque para ir testando  
                          //  ' , $table_name_item_estoque ie '+
                           'where i.fkItemGrupoId = gr.id '+
                           '  and i.fkItemUnmedId = un.id '+
                           '  and i.fkItemTipoId  = tp.id '
                          //  '  and ie.fk_item_id   = i.id '
                           ;

  // passar a PK - se for composta tem que implementar as colunas
  Future<ItemEstoque> findPorPkk(int fkItemId, int lote) async {
    final dbClient = await db;
    final list = await dbClient.rawQuery("select * from $tableName "+
                                         "where fk_item_id = ? "+
                                         "  and lote = ? ", [fkItemId, lote]);
    if (list.length > 0){
      return fromJson(list.first);
    }
    return null;
  }

  // Future<List<ItemEstoque>> listarItemEstoque() async {
  //   final dbClient = await db;
  //   final result = await dbClient.rawQuery(
  //       //await dbClient.rawQuery('select  * from $table_name_item_estoque');
  //       'select ie.fk_item_id, ie.lote, ie.qt_saldo, ie.vl_unit, ie.qt_reservado, it.descr as descrItem from $table_name_item_estoque ie INNER JOIN $table_name_item it ON it.id = ie.fk_item_id');
  //   var list =
  //       result.map<ItemEstoque>((json) => ItemEstoque.fromJson(json)).toList();
  //   return list;
  // }

  // Future<List<ItemEstoque>> findPorItem(int itemId) async {
  //   final dbClient = await db;
  //   final list = await dbClient.rawQuery("select * from $tableName where id = ? ", [id]);
  //   return list.map<T>((json) => fromJson(json)).toList();
  // }


}