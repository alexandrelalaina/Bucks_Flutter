
  import 'entity_base.dart';

class Item extends EntityBase
  {
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

    Item({this.id, 
        this.descr, 
        this.cd, 
        this.cdControlaEstoque, 
        this.fkItemTipoId, 
        this.fkItemGrupoId, 
        this.fkItemUnmedId,
        this.itemTipoDescr,
        this.itemGrupoDescr,
        this.itemUnMedDescr
    });

    Item.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      cd = json['cd'];
      descr = json['descr'];
      cdControlaEstoque = json['cdControlaEstoque'];
      fkItemTipoId = json['fkItemTipoId'];
      fkItemGrupoId = json['fkItemGrupoId'];
      fkItemUnmedId = json['fkItemUnmedId'];

      itemTipoDescr = json['itemTipoDescr'];
      itemGrupoDescr = json['itemGrupoDescr'];
      itemUnMedDescr = json['itemUnMedDescr'];
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