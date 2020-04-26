import 'package:bucks/src/classes/item_tipo.dart';
import 'package:bucks/src/utils/constants.dart';

import 'base_dao.dart';

class ItemTipoDAO extends BaseDAO<ItemTipo> {
  @override
  ItemTipo fromJson(Map<String, dynamic> map) {
    return ItemTipo.fromJson(map);
  }

  @override
  String get sqlComJoin => null;

  @override
  String get tableName => table_name_item_tipo;

  Future<String> listarDescrItemTipo() async {
    final dbClient = await db;

    final sql = 'select descr from $table_name_item_tipo where id = ?';

    final result = await dbClient.rawQuery(sql, [1]);

    print(result);

    return result.toString();
  }

}