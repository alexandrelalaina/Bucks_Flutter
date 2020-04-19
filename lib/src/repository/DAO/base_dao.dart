import 'package:bucks/src/classes/entity_base.dart';
import 'package:bucks/src/repository/bucks_db_repository.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDAO<T extends EntityBase> {

  Future<Database> get db => BucksDBRepository.getInstance().db;

  String get tableName;

  String get sqlComJoin;
  

  T fromJson(Map<String, dynamic> map);

  Future<int> save (T entity) async {
    var dbClient = await db;
    var id = await dbClient.insert(tableName, entity.toJson(),
                      conflictAlgorithm: ConflictAlgorithm.replace);
    print("id: $id");
    return id;
  }

  // passar a PK - se for composta tem que implementar as colunas
  Future<int> delete (int id) async {
    var dbClient = await db;
    return await dbClient.rawDelete("delete from $tableName "+
                                    "where id = ? ", [id]);
  }

  // passar a PK - se for composta tem que implementar as colunas
  Future<int> deleteAll () async {
    var dbClient = await db;
    return await dbClient.rawDelete("delete from $tableName ");
  }

  Future<List<T>> query(String sql, [List<dynamic> arguments] ) async {
    final dbClient = await db;
    final list = await dbClient.rawQuery(sql, arguments);
    return list.map<T>((json) => fromJson(json)).toList();
  }

  Future<List<T>> findAll() {
    return query('$sqlComJoin');
    // return query('select * from $tableName');

  }

  // passar a PK - se for composta tem que implementar as colunas
  Future<T> findPorPk(int id) async {
    List<T> list = await query('select * from $tableName where id = ? ', [id]);
    return list.length > 0 ? list.first : null;
  }

  Future<bool> exists (int id) async {
    T reg = await findPorPk(id);
    var exists = reg != null;
    return exists;
  }

  Future<int> count() async {
    final dbClient = await db;
    final result = await dbClient.rawQuery('select count(*) from $tableName');
    return Sqflite.firstIntValue(result);
  }



}