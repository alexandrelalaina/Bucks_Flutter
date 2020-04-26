import 'package:bucks/src/classes/item.dart';
import 'package:bucks/src/shared/utils/constants.dart';

import 'base_dao.dart';

class ItemDAO extends BaseDAO<Item> {
  @override
  Item fromJson(Map<String, dynamic> map) {
    return Item.fromJson(map);
  }

  @override
  String get sqlComJoin => 'select it.id, it.descr, it.cd, it.cdControlaEstoque, it.fkItemTipoId, it.fkItemGrupoId, it.fkItemUnmedId '+
                               ' , itp.descr as fk_item_descr '+
                               ' , ig.descr as fk_item_grupo_descr '+
                               ' , iu.descr as fk_item_unmed_descr '+
                               'from $table_name_item it INNER JOIN $table_name_item_tipo itp ON itp.id = it.fkItemTipoId '+
                               'INNER JOIN $table_name_item_grupo ig ON ig.id = it.fkItemGrupoId '+
                               'INNER JOIN $table_name_item_unmed iu ON iu.id = it.fkItemUnmedId';

  @override
  String get tableName => 'item';

  

}