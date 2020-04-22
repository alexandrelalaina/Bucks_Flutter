import 'package:bucks/src/classes/cg_ref_codes.dart';
import 'package:bucks/src/repository/DAO/base_dao.dart';
import 'package:bucks/src/utils/constants.dart';

class CgRefCodesDAO extends BaseDAO {
  
  @override
  CgRefCodes fromJson(Map<String, dynamic> map) {
    return CgRefCodes.fromJson(map);
  }

  @override
  String get sqlComJoin => null;

  @override
  // TODO: implement tableName
  String get tableName => table_name_cg_ref_codes;
   

}