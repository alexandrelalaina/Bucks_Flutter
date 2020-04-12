
import 'ItemGrupo.dart';
import 'ItemTipo.dart';
import 'ItemUnMed.dart';

class Item
{
  int id;
  String descricao;
  ItemTipo fkItemTipoId;
  ItemGrupo fkItemGrupoId;
  ItemUnMed fkItemUnMedId;

  Item(this.id
    , this.descricao
    , this.fkItemTipoId
    , this.fkItemGrupoId
    , this.fkItemUnMedId
     );

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    fkItemTipoId = json['fkItemTipoId'];
    fkItemGrupoId = json['fkItemGrupoId'];
    fkItemTipoId = json['fkItemTipoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['fkItemTipoId'] = this.fkItemTipoId;
    data['fkItemGrupoId'] = this.fkItemGrupoId;
    data['fkItemTipoId'] = this.fkItemTipoId;
    return data;
  }

}