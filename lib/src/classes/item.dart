
  import 'package:bucks/src/pages/item/item_list/item_list_controller.dart';

  class Item
  {
    int id;
    String descricao; 
    String cd;  
    String cdControlaEstoque;
    int fkItemTipoId;
    int fkItemGrupoId;
    String fkItemUnmedId;
    String itemTipoDescr;
    String itemGrupoDescr;
    String itemUnMedDescr;

    Item(this.id, 
        this.descricao, 
        this.cd, 
        this.cdControlaEstoque, 
        this.fkItemTipoId, 
        this.fkItemGrupoId, 
        this.fkItemUnmedId,
        this.itemTipoDescr,
        this.itemGrupoDescr,
        this.itemUnMedDescr
        );

    Item.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      cd = json['cd'];
      descricao = json['descricao'];
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
      data['descricao'] = this.descricao;
      data['cdControlaEstoque'] = this.cdControlaEstoque;
      data['fkItemTipoId'] = this.fkItemTipoId;
      data['fkItemGrupoId'] = this.fkItemGrupoId;
      data['fkItemUnmedId'] = this.fkItemUnmedId;
      data['itemTipoDescr'] = this.itemTipoDescr;
      data['itemGrupoDescr'] = this.itemGrupoDescr;
      data['itemUnMedDescr'] = this.itemUnMedDescr;

      return data;

    }
  }