import 'entity_base.dart';

class Item extends EntityBase {
  int id;
  String descr;
  String cd;
  String cdControlaEstoque;
  int fkItemTipoId;
  int fkItemGrupoId;
  String fkItemUnmedId;

  // colunas de outras tabelas
  String itemTipoDescr;
  String itemGrupoDescr;
  String itemUnMedDescr;

  Item(
      {this.id,
      this.descr,
      this.cd,
      this.cdControlaEstoque,
      this.fkItemTipoId,
      this.fkItemGrupoId,
      this.fkItemUnmedId,
      this.itemTipoDescr,
      this.itemGrupoDescr,
      this.itemUnMedDescr});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cd = json['cd'];
    descr = json['descr'];
    cdControlaEstoque = json['cdControlaEstoque'];
    fkItemTipoId = json['fk_item_tipo_id'];
    fkItemGrupoId = json['fk_item_grupo_id'];
    fkItemUnmedId = json['fk_item_unmed_id'];

    itemTipoDescr = json['fk_item_tipo_descr'];
    itemGrupoDescr = json['fk_item_grupo_descr'];
    itemUnMedDescr = json['fk_item_unmed_descr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cd'] = this.cd;
    data['descr'] = this.descr;
    data['cdControlaEstoque'] = this.cdControlaEstoque;
    data['fkItemTipoId'] = this.fkItemTipoId;
    data['fkItemGrupoId'] = this.fkItemGrupoId;
    data['fkItemUnmedId'] = this.fkItemUnmedId;

    // data['itemTipoDescr'] = this.itemTipoDescr;
    // data['itemGrupoDescr'] = this.itemGrupoDescr;
    // data['itemUnMedDescr'] = this.itemUnMedDescr;

    return data;
  }
}
