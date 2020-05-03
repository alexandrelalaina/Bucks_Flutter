import 'package:bucks/src/classes/producao_item.dart';
import 'package:bucks/src/shared/utils/constants.dart';

import 'base_dao.dart';

class ProducaoItemDAO extends BaseDAO<ProducaoItem> {
  @override
  ProducaoItem fromJson(Map<String, dynamic> map) {
    return ProducaoItem.fromJson(map);
  }

  @override
  String get sqlComJoin => null;

  @override
  String get tableName => 'producao_item';

  @override
  String get orderByCols => ' seq desc ';

  Future<List<ProducaoItem>> listarProducaoItem2() async {
    final dbClient = await db;
    final result = await dbClient.rawQuery(
        'select pi.seq, pr.id, pr.descr as descrItem, it.id, it.descr as descrProducao, ' +
            ', pi.qt, pi.vl_unit, pi.cd_tipo, pi.cd_status ' +
            'from $table_name_producao_item pi INNER JOIN $table_name_producao pr ON pr.id = pi.fk_producao_id ' +
            'INNER JOIN $table_name_item it ON it.id = pi.fk_item_id');
    var list = result
        .map<ProducaoItem>((json) => ProducaoItem.fromJson(json))
        .toList();
    return list;
  }
}
