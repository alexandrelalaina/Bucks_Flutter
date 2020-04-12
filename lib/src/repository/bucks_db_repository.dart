import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:bucks/src/classes/ItemGrupo.dart';
import 'package:bucks/src/classes/ItemTipo.dart';
import 'package:bucks/src/classes/ItemUnMed.dart';
import 'package:bucks/src/classes/cgRefCodes.dart';
import 'package:bucks/src/classes/item.dart';
import 'package:bucks/src/classes/movtoEstoqueTipo.dart';
import 'package:bucks/src/classes/producao.dart';
import 'package:bucks/src/classes/producaoItem.dart';
import 'package:bucks/src/pages/cg_ref_codes/cg_ref_codes_controller.dart';
import 'package:bucks/src/pages/item/item_controller.dart';
import 'package:bucks/src/pages/item_grupo/item_grupo_controller.dart';
import 'package:bucks/src/pages/item_tipo/item_tipo_controller.dart';
import 'package:bucks/src/pages/item_unmed/item_unmed_controller.dart';
import 'package:bucks/src/pages/movto_estoque/movto_estoque_tipo/movto_estoque_tipo_controller.dart';
import 'package:bucks/src/pages/producao/producao_controller.dart';
import 'package:bucks/src/pages/producao/producao_item_controller.dart';
import 'package:bucks/src/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BucksDBRepository extends Disposable {
  static final BucksDBRepository _instance = BucksDBRepository.getInstance();

  factory BucksDBRepository() => _instance;

  BucksDBRepository.getInstance();

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;

    _db = await initDb();
    return _db;
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'bucks.db');
    var db = await openDatabase(path, readOnly: false);
    return db;
  }

  //---------------------------------------------------------//
  // ITEM
  //---------------------------------------------------------//

  Future<int> inserirItem(
    ItemController store,
    ItemTipo itemTipo, 
    ItemGrupo itemGrupo, 
    ItemUnMed itemUnMed) async { 
    var dbClient = await db;

    final sql =
        'insert or replace into $table_name_item(cd, descricao, cdControlaEstoque, fkItemTipoId, fkItemGrupoId, fkItemUnmedId) VALUES (?,?,?,?,?,?)';
    print(sql);

    var id = await dbClient.rawInsert(sql, ['1', store.descricao.text, store.cdControlaEstoque.text.toUpperCase(), itemTipo.id, itemGrupo.id, itemUnMed.id]);

    print('id: $id');
    return id;
  }

  Future<List<Item>> listarItem() async {
    final dbClient = await db;
    final result = await dbClient.rawQuery('select * from $table_name_item');
    var list = result.map<Item>((json) => Item.fromJson(json)).toList();
    return list;
  }


  //---------------------------------------------------------//
  // ITEM_TIPO
  //---------------------------------------------------------//

  Future<int> inserirItemTipo({@required ItemTipoController store}) async {
    var dbClient = await db;

    final sql =
        'insert or replace into $table_name_item_tipo(descricao) VALUES (?)';
    print(sql);
    var id = await dbClient.rawInsert(sql, [store.descricao.text]);

    print('id: $id');
    return id;
  }

  Future<List<ItemTipo>> listarItemTipo() async {
    final dbClient = await db;
    final result =
        await dbClient.rawQuery('select * from $table_name_item_tipo');
    var list =
        result.map<ItemTipo>((json) => ItemTipo.fromJson(json)).toList();
    return list;
  }

  Future<String> listarDescrItemTipo() async {
    final dbClient = await db;

    final sql = 'select descricao from $table_name_item_tipo where id = ?';

     final result = await dbClient.rawQuery(sql, [1]);
    
    print(result); 

    return result.toString();
  }

  //---------------------------------------------------------//
  // ITEM_GRUPO
  //---------------------------------------------------------//

  Future<int> inserirItemGrupo({@required ItemGrupoController store}) async {
    var dbClient = await db;

    final sql =
        'insert or replace into $table_name_item_grupo(descricao) VALUES (?)';
    print(sql);
    var id = await dbClient.rawInsert(sql, [store.descricao.text]);

    print('id: $id');
    return id;
  }

  Future<List<ItemGrupo>> listarItemGrupo() async {
    final dbClient = await db;
    final result =
        await dbClient.rawQuery('select * from $table_name_item_grupo');
    var list =
        result.map<ItemGrupo>((json) => ItemGrupo.fromJson(json)).toList();
    return list;
  }

  //---------------------------------------------------------//
  // ITEM_UNMED
  //---------------------------------------------------------//

  Future<int> inserirItemUnMed({@required ItemUnMedController store}) async {
    var dbClient = await db;

    final sql =
        'insert or replace into $table_name_item_unmed(id, descr) VALUES (?,?)';
    print(sql);
    var id = await dbClient.rawInsert(sql, 
                                     [store.id.text, 
                                      store.descr.text]);

    print('id: $id');
    return id;
  }

  Future<List<ItemUnMed>> listarItemUnMed() async {
    final dbClient = await db;
    final result =
        await dbClient.rawQuery('select * from $table_name_item_unmed');
    var list =
        result.map<ItemUnMed>((json) => ItemUnMed.fromJson(json)).toList();
    return list;
  }

  //---------------------------------------------------------//
  // PRODUCAO
  //---------------------------------------------------------//

  Future<int> inserirProducao({@required ProducaoController store}) async {
    var dbClient = await db;

    // final sql = 'insert or replace into $table_name_producao(descr) VALUES (?)';
    final sql = 'insert or replace into $table_name_producao(fk_producao_tipo_id, descr, dt_producao_ini, dt_producao_fim, cd_status ) VALUES (?,?,?,?,?)';
    print(sql);
    print("***testando store da PRODUCAO => ($store)");
    print("id:"+store.id.text);
    print("fkProducaoTipoId:"+store.fkProducaoTipoId.text);
    print("descr:"+store.descr.text);
    print("dtProducaoIni:"+store.dtProducaoIni.text);
    print("dtProducaoFim:"+store.dtProducaoFim.text);
    print("cdStatus:"+store.cdStatus.text);
    
    var id = await dbClient.rawInsert(sql, 
                                     [store.fkProducaoTipoId.text,
                                      store.descr.text,
                                      store.dtProducaoIni.text,
                                      store.dtProducaoFim.text,
                                      store.cdStatus.text,]);

    print('id: $id');
    return id;
  }

  Future<List<Producao>> listarProducao() async {
    final dbClient = await db;
    final result =
        await dbClient.rawQuery('select * from $table_name_producao');
    var list =
        result.map<Producao>((json) => Producao.fromJson(json)).toList();
    return list;
  } 

  //---------------------------------------------------------//
  // PRODUCAO_ITEM
  //---------------------------------------------------------//

  Future<int> inserirProducaoItem({@required ProducaoItemController store}) async {
    var dbClient = await db;

    // final sql = 'insert or replace into $table_name_producao(descr) VALUES (?)';
    final sql = 'insert or replace into $table_name_producao_item(fk_producao_id, '+
                                                                //  'seq, '+ TODO REFAZER
                                                                 'fk_item_id, '+
                                                                 'qt, '+
                                                                 'vl_unit, '+
                                                                 'cd_tipo, '
                                                                 'cd_status )'+ 
                                                                 'VALUES (?,?,?,?,?,?)';
    print(sql);
    print("***testando store da PRODUCAO => ($store)");
    print("tecFkProducaoId:"+store.tecFkProducaoId.text);
    print("tecSeq:"+store.tecSeq.text);
    print("tecFkItemId:"+store.tecFkItemId.text);
    print("tecQt:"+store.tecQt.text);
    print("tecVl:"+store.tecVlUnit.text);
    print("tecCdTipo:"+store.tecCdTipo.text);
    print("tecCdStatus:"+store.tecCdStatus.text);
    
    var id = await dbClient.rawInsert(sql, 
                                     [store.tecFkProducaoId.text,
                                      // store.tecSeq.text,
                                      store.tecFkItemId.text,
                                      store.tecQt.text,
                                      store.tecVlUnit.text,
                                      store.tecCdTipo.text,
                                      store.tecCdStatus.text,
                                      ]);

    print('id: $id');
    return id;
  }

  Future<List<ProducaoItem>> listarProducaoItem(int fkProducaoId) async {
    final dbClient = await db;
    final result = await dbClient.rawQuery('select * from $table_name_producao_item where fk_producao_id = $fkProducaoId ');
    var list = result.map<ProducaoItem>((json) => ProducaoItem.fromJson(json)).toList();
    return list;
  }

  // Baixar ProducaoItem
  // Ler todos os itens que tem na producao e efetuar a movto_estoque
  // retornar descr com erro ou nao
  // String prodItemBaixar(Producao producao) {
  //   if (producao.dtProducaoFim.isEmpty){
  //     return 'Data Fim da Produção deve estar preenchida!';
  //   }

  //   if ( ! (producao.cdStatus=='F')){
  //     return 'Status da Produção deve estar como Finalizada(F), para então efetuar a baixa dos itens!';
  //   }

  //   List<ProducaoItem> producaoItens = [];
  //   var future = listarProducaoItem(producao.id);
  //   producaoItens = await future;
  //   for (var reg in future) {
  //     await print(reg.)
  //   }


    // Future<List<ProducaoItem>> listaProdItem;
    // Future<List<ProducaoItem>> listaProdItem = listarProducaoItem(producao.id);
    // for (var reg in listaProdItem) {
    //   print(item.fkProducaoId.cdStatus);
    // }

  //   List<ProducaoItem> xlistaProdItem = listarProducaoItem(producao.id);

  //   for (var item in listaProdItem) {
  //     print(item.fkProducaoId.cdStatus);
  //   }

  //   for (var reg in listaProdItem ) {
  //     print(reg.)
  //   }

  //   listarProducaoItem

  //   return 'Feito com sucesso!';

  // }
  //---------------------------------------------------------//
  // CG_REF_CODES
  //---------------------------------------------------------//

  Future<int> inserirCgRefCodes({@required CgRefCodesController store}) async {
    var dbClient = await db;

    final sql =
        'insert or replace into $table_name_cg_ref_codes (rv_dommain, rv_low_value, rv_high_value, rv_descr, rv_abrev ) VALUES (?,?,?,?,?)';
    print(sql);
    var id = await dbClient.rawInsert(sql, 
                                      [store.rvDomain.text,
                                       store.rvLowValue.text,
                                       store.rvHighValue.text,
                                       store.rvDescr.text,
                                       store.rvAbrev.text
                                       ]);

    print('id: $id');
    return id;
  }

  Future<List<CgRefCodes>> listarCgRefCodes() async {
    final dbClient = await db;
    final result =
        await dbClient.rawQuery('select * from $table_name_cg_ref_codes');
    var list =
        result.map<CgRefCodes>((json) => CgRefCodes.fromJson(json)).toList();
    return list;
  }

   //---------------------------------------------------------//
  // CG_REF_CODES
  //---------------------------------------------------------//

  Future<int> inserirMovtoEstoqueTipo({@required MovtoEstoqueTipoController store}) async {
    var dbClient = await db;

    final sql =
        'insert or replace into $table_name_movto_estoque_tipo (descr, cd_tipo_movto ) VALUES (?,?)';
    print(sql);
    var id = await dbClient.rawInsert(sql, 
                                      [store.tecDescr.text,
                                       store.tecCdTipoMovto.text,
                                       ]);

    print('id: $id');
    return id;
  }

  Future<List<MovtoEstoqueTipo>> listarMovtoEstoqueTipo() async {
    final dbClient = await db;
    final result =
        await dbClient.rawQuery('select * from $table_name_movto_estoque_tipo');
    var list =
        result.map<MovtoEstoqueTipo>((json) => MovtoEstoqueTipo.fromJson(json)).toList();
    return list;
  }


  //------------------------------------------------------
  // MÉTODOS GENÉRICOS
  //------------------------------------------------------

  Future<int> listarQuantidadeLinhas(String tableName) async {
    try {
      final dbClient = await db;
      final result = await dbClient.rawQuery('select count(*) from $tableName');
      return Sqflite.firstIntValue(result);
    } catch (ex) {
      return 0;
    }
  }

  Future<int> deletarTodosDadosDaTabelas(String tableName) async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from $tableName');
  }

  Future existsTable(String tableName) async {
    var dbClient = await db;

    final sql =
        "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName'";

    final result = await dbClient.rawQuery(sql);
    print(result);
  }


  Future<bool> editQuotation(int id, String descricao, String action) async {
    // final url = '${CoreService.urlBaseMoedas}/edit';
    // final userBUCKS = await CoreService.getUser();
    // print("> post: $url - userBUCKS");

    var data = {'id': id, 'descricao': descricao, 'action': action};
    print('service edit -> $data');
    var header = {'Content-Type': 'application/x-www-form-urlencoded'};

    print("$id - $descricao- $action");

    final response = await http.post(url, headers: header, body: data);

    if (response.body == "ok")
      return true;
    else
      return false;
  }  

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  @override
  void dispose() {
    close();
  }
}
