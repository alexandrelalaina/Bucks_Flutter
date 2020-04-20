import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:bucks/src/shared/models/user.dart';
import 'package:bucks/src/utils/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class UserDb extends Disposable {
  static final UserDb _instance = UserDb.getInstance();

  factory UserDb() => _instance;

  UserDb.getInstance();

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      print("teste");
      //criar tabelas
      _onCreate(_db, 0);
      return _db;
    }

    _db = await initDb();

    //criar tabelas
    //_onCreate(_db, 0);

    return _db;
  }

  Future<bool> dbExists;

  initDb() async {
    var version = 1;

    String databasePath = await getDatabasesPath();

    String path = join(databasePath, 'bucks.db');
    print('db $path');

    dbExists = io.File(path).exists();

    var db = await openDatabase(path,
        version: version,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        readOnly: false);
    return db;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion == 1) {
      await updateVersion2(db);
    }
  }

  void _onCreate(Database db, int newVersion) async {
    // try{
    //   await db.execute('DROP TABLE $table_name_producao');
    // } catch (e) {
    //   print("***ERRO AO DROPAR TABELA $table_name_producao !");
    // }

    try {
      await db.execute(
          'CREATE TABLE $table_name_producao(id INTEGER PRIMARY KEY AUTOINCREMENT, fk_producao_tipo_id INTEGER, descr TEXT, dt_producao_ini TEXT, dt_producao_fim TEXT, cd_status TEXT )');
    } catch (e) {
      print("***ERRO AO CRIAR TABELA $table_name_producao !");
    }

    // TODO
    // refazer a PK
    try {
      await db.execute(
          'CREATE TABLE $table_name_producao_item(seq INTEGER PRIMARY KEY AUTOINCREMENT , ' +
              'fk_producao_id INTEGER , ' +
              'fk_item_id INTEGER, ' +
              'qt REAL, ' +
              'vl_unit REAL, ' +
              'cd_tipo TEXT, ' +
              'cd_status TEXT )');
    } catch (e) {
      print("***ERRO AO CRIAR TABELA $table_name_producao_item !");
    }

    try {
      await db.execute(
          'CREATE TABLE $table_name_item_unmed(id TEXT PRIMARY KEY, descr TEXT)');
    } catch (e) {
      print("***ERRO AO CRIAR TABELA $table_name_item_unmed !");
    }

    try {
      await db.execute(
          'CREATE TABLE $table_name_item_tipo(id INTEGER PRIMARY KEY AUTOINCREMENT, descricao TEXT)');
    } catch (e) {
      print("***ERRO AO CRIAR TABELA $table_name_item_tipo !");
    }

    try {
      await db.execute(
          'CREATE TABLE $table_name_item_grupo(id INTEGER PRIMARY KEY AUTOINCREMENT, descricao TEXT)');
    } catch (e) {
      print("***ERRO AO CRIAR TABELA $table_name_item_grupo !");
    }

    // try{
    //   await db.execute(
    //     'DROP TABLE $table_name_item');
    //     print('Tabela DROPADA com sucesso! TABLE ($table_name_item)');
    // } catch (e) {
    //   print("***ERRO AO DROPAR TABELA $table_name_item !");
    // }

    try {
      await db.execute(
          'CREATE TABLE $table_name_item(id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
              'descricao TEXT, ' +
              'cd TEXT, ' +
              'cdControlaEstoque TEXT, ' +
              'fkItemTipoId REFERENCES $table_name_item_tipo(id), ' +
              'fkItemGrupoId REFERENCES $table_name_item_grupo(id), ' +
              'fkItemUnmedId REFERENCES $table_name_item_unmed(id))');
      print('Tabela criada com sucesso! TABLE ($table_name_item)');
    } catch (e) {
      print("***ERRO AO CRIAR TABELA $table_name_item !");
    }

    try {
      await db
          .execute('CREATE TABLE $table_name_item_estoque(fk_item_id INTEGER' +
              ', lote INTEGER PRIMARY KEY AUTOINCREMENT' + //TODO refazer a PK
              ', qt_saldo REAL' +
              ', vl_unit REAL' +
              ', qt_reservado REAL)');
      print('Tabela criada com sucesso! TABLE ($table_name_item_estoque)');
    } catch (e) {
      print("***ERRO AO CRIAR TABELA $table_name_item_estoque !");
    }

    // try{
    //   await db.execute(
    //     'DROP TABLE $table_name_cg_ref_codes');
    // } catch (e) {
    //   print("***ERRO AO DROPAR TABELA $table_name_cg_ref_codes !");
    // }

    try {
      await db.execute(
          'CREATE TABLE $table_name_cg_ref_codes(id INTEGER PRIMARY KEY AUTOINCREMENT, rv_dommain TEXT, rv_low_value TEXT, rv_high_value TEXT, rv_descr TEXT, rv_abrev TEXT)');
    } catch (e) {
      print("***ERRO AO CRIAR TABELA $table_name_cg_ref_codes !");
    }

    try {
      await db.execute(
          'CREATE TABLE $table_name_movto_estoque_tipo(id INTEGER PRIMARY KEY AUTOINCREMENT, descr TEXT, cd_tipo_movto TEXT)');
    } catch (e) {
      print("***ERRO AO CRIAR TABELA $table_name_movto_estoque_tipo !");
    }

    try {
      await db.execute(
          'CREATE TABLE $table_name_movto_estoque(id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
              'fk_item_estoque_item_id INTEGER, ' +
              'fk_item_estoque_lote INTEGER, ' +
              'fk_movto_estoque_tipo_id INTEGER, ' +
              'dt TEXT, ' +
              'qtd REAL, ' +
              'vL_unit REAL, ' +
              'qt_saldo_ant REAL, ' +
              'qt_saldo_pos REAL, ' +
              'vL_unit_ant REAL, ' +
              'vL_unit_pos REAL, ' +
              'fk_proditem_producao_id INTEGER, ' +
              'fk_proditem_seq INTEGER ' +
              ')');
    } catch (e) {
      print("***ERRO AO CRIAR TABELA $table_name_movto_estoque !");
    }

    // pause
    final sql =
        'insert or replace into $table_name_item(cd, descricao, cdControlaEstoque, fkItemTipoId, fkItemGrupoId, fkItemUnmedId) VALUES (?,?,?,?,?,?)';
    print(sql);

    var dbClient = await db;
    var id = await dbClient.rawInsert(sql, ['1', "Item 1", "S", 1, 1, 1]);

    final sql2 =
        'insert or replace into $table_name_item_estoque(fk_item_id, lote, qt_saldo, vl_unit, qt_reservado) VALUES (?,?,?,?,?)';

    var id2 = await dbClient.rawInsert(sql2, [
      1,
      1,
      10,
      1,
      1,
    ]);

    // await db.execute(
    //     'CREATE TABLE reports(numSeq INTEGER PRIMARY KEY, nome TEXT, objNome TEXT, dtCad TEXT, username TEXT, path TEXT)');

    // await db.execute(
    //     'CREATE TABLE mapas(numRegiaoAgricola INTEGER, txtRegiaoAgricola TEXT, numFazenda INTEGER,  txtFazendaNome TEXT, proprietario TEXT, responsavel TEXT,    cdRegiao INTEGER, numSeqMapa INTEGER PRIMARY KEY, txtTemMapa TEXT, mapas TEXT, data TEXT,  path TEXT, username TEXT)');

    // await db.execute(
    //     'CREATE TABLE talhoes(numSeq INTEGER  PRIMARY KEY autoincrement, regiao INTEGER ,codigoPropr INTEGER ,propriedade TEXT ,numeroPropriedade INTEGER ,proprietario TEXT ,nomeTalhao TEXT ,variedade TEXT ,anoPlantio INTEGER ,qtPlantas INTEGER , falha INTEGER, replanta INTEGER, espacamento TEXT,  num INTEGER ,itemNum INTEGER ,codigoCenso INTEGER, area INTEGER, covas INTEGER)');

    // await db.execute(
    //     'CREATE TABLE regiao(regiaoCd INTEGER PRIMARY KEY, descr TEXT, responsavel TEXT, username TEXT, qtMapas INTEGER)');

    // await updateVersion2(db);
  }

  updateVersion2(Database db) async {
    List<String> updateVersion2 = [
      'CREATE TABLE ITEM(id INTEGER PRIMARY KEY, descricao TEXT)',
      // 'CREATE TABLE $table_name_almoxarifado(instNum INTEGER PRIMARY KEY, instNome TEXT, upfjPfjNum REFERENCES $table_name_unidade(upfjPfjNum), upfjNum REFERENCES $table_name_unidade(upfjNum))',
      // 'CREATE TABLE $table_name_receituario_item(receituarioNum INTEGER, receituarioDescr TEXT, itemNum INTEGER, itemNome TEXT, itemCd TEXT, itemUnidmedCd TEXT, itemDtVcto TEXT, itemLote TEXT, itemQtEstoque REAL, itemQtReceituario REAL, PRIMARY KEY (receituarioNum, itemNum))',
      // 'CREATE TABLE $table_name_item(itemNum INTEGER PRIMARY KEY, itemNome TEXT, itemCd TEXT, itemUnidmedCd TEXT, itemDtVcto TEXT, itemLote TEXT, itemQtEstoque REAL, itemQtReceituario REAL)'
    ];

    await db.execute(updateVersion2[0]);
    // await db.execute(updateVersion2[1]);
    // await db.execute(updateVersion2[2]);
    // await db.execute(updateVersion2[3]);
  }

  Future existsTable(String tableName) async {
    var dbClient = await db;

    final sql =
        "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName'";

    final result = await dbClient.rawQuery(sql);
    print(result);
  }

  Future<int> saveUser(User user) async {
    var dbClient = await db;

    final sql =
        'insert or replace into users(username, name, password, email) VALUES (?,?,?,?)';
    print(sql);
    var id = await dbClient
        .rawInsert(sql, [user.username, user.name, user.password, user.email]);

    print('id: $id');
    return id;
  }

  Future<List<Map>> getAllUsers() async {
    final dbClient = await db;
    final result = await dbClient.rawQuery('select * from users');
    return result.toList();
  }

  Future<int> getCountUsers() async {
    final dbClient = await db;
    final result = await dbClient.rawQuery('select count(*) from users');
    return Sqflite.firstIntValue(result);
  }

  Future<User> getUser(String username) async {
    var dbClient = await db;
    final result = await dbClient
        .rawQuery('select * from users where username = ?', [username]);

    if (result.length > 0) return User.fromJson(result.first);

    return null;
  }

  Future<bool> exists(User user) async {
    User rep = await getUser(user.username);
    var exists = rep != null;
    return exists;
  }

  Future<int> deleteUser(String username) async {
    var dbClient = await db;
    return await dbClient
        .rawDelete('delete from users where username = ?', [username]);
  }

  Future<int> deleteAllUsers() async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from users');
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
