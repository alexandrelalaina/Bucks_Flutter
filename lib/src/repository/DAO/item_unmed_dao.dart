import 'package:bucks/src/classes/item_unmed.dart';
import 'package:bucks/src/repository/DAO/base_dao.dart';
import 'package:bucks/src/utils/constants.dart';

class ItemUnmedDAO extends BaseDAO<ItemUnmed> {
  @override
  ItemUnmed fromJson(Map<String, dynamic> map) {
    return ItemUnmed.fromJson(map);
  }

  @override
  String get sqlComJoin => null;

  @override
  String get tableName => table_name_item_unmed;

}