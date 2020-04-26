import 'package:bucks/src/classes/item_grupo.dart';
import 'package:bucks/src/utils/constants.dart';

import 'base_dao.dart';

class ItemGrupoDAO extends BaseDAO<ItemGrupo> {
  @override
  ItemGrupo fromJson(Map<String, dynamic> map) {
    return ItemGrupo.fromJson(map);
  }

  @override
  String get sqlComJoin => null;

  @override
  String get tableName => table_name_item_grupo;

}