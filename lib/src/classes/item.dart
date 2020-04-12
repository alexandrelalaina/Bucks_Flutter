
import 'package:bucks/src/classes/ItemGrupo.dart';
import 'package:bucks/src/classes/ItemTipo.dart';
import 'package:bucks/src/classes/ItemUnMed.dart';
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

  ItemListController itemListController;

  Item(this.id, 
       this.descricao, 
       this.cd, 
       this.cdControlaEstoque, 
       this.fkItemTipoId, 
       this.fkItemGrupoId, 
       this.fkItemUnmedId
      );

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cd = json['cd'];
    descricao = json['descricao'];
    cdControlaEstoque = json['cdControlaEstoque'];
    fkItemTipoId = json['fkItemTipoId'];
    fkItemGrupoId = json['fkItemGrupoId'];
    fkItemUnmedId = json['fkItemUnmedId'];
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
    
    return data;

  }
}