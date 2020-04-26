import 'package:bucks/src/classes/movto_estoque.dart';
import 'package:bucks/src/utils/constants.dart';

import 'base_dao.dart';

class MovtoEstoqueDAO extends BaseDAO<MovtoEstoque> {
  @override
  MovtoEstoque fromJson(Map<String, dynamic> map) {
    return MovtoEstoque.fromJson(map);
  }

  @override
  String get sqlComJoin => null;

  @override
  String get tableName => table_name_movto_estoque;

}