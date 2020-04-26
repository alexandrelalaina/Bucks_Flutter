import 'package:bucks/src/classes/producao.dart';
import 'package:bucks/src/shared/utils/constants.dart';
import 'package:flutter/material.dart';

import 'base_dao.dart';

class ProducaoDAO extends BaseDAO<Producao> {
  @override
  Producao fromJson(Map<String, dynamic> map) {
    return Producao.fromJson(map);
  }

  @override
  String get sqlComJoin => null;

  @override
  String get tableName => 'producao';

  Future<List<Producao>> listarProducaoByDescr({@required String descr}) async {
    final dbClient = await db;
    final result = await dbClient.rawQuery(
        'select * from $table_name_producao where descr = ?', [descr]);
    var list = result.map<Producao>((json) => Producao.fromJson(json)).toList();
    return list;
    // where not exists (select 1 from $table_name_transacao tra where tra.receituarioInstNum = rec.receituarioInstNum and tra.receituarioNum = rec.receituarioNum and tra.tpmovtoNum = 802)
  }


}