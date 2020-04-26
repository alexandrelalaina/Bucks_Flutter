import '../../classes/item.dart';
import '../../utils/constants.dart';
import 'base_dao.dart';

class ItemDAO extends BaseDAO<Item> {
  @override
  Item fromJson(Map<String, dynamic> map) {
    return Item.fromJson(map);
  }

  @override
  String get sqlComJoin => 'select it.id, it.descr, it.cd, it.cdControlaEstoque, it.fkItemTipoId, it.fkItemGrupoId, it.fkItemUnmedId '+
                               ' , itp.descr as itemTipoDescr '+
                               ' , ig.descr as itemGrupoDescr '+
                               ' , iu.descr as itemUnMedDescr '+
                               'from $table_name_item it INNER JOIN $table_name_item_tipo itp ON itp.id = it.fkItemTipoId '+
                               'INNER JOIN $table_name_item_grupo ig ON ig.id = it.fkItemGrupoId '+
                               'INNER JOIN $table_name_item_unmed iu ON iu.id = it.fkItemUnmedId';

  @override
  String get tableName => 'item';

  

}