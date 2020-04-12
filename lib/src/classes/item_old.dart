
class Item
{
  int id;
  String descricao;
  // ItemTipo fkItemTipoId;
  // ItemGrupo fkItemGrupoId;
  // ItemUnMed fkItemTipo;

  Item(this.id, this.descricao
    //  , this.fkItemGrupoId
     );

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    // fkItemTipoId = json['fkItemTipoId'];
    // fkItemGrupoId = json['fkItemGrupoId'];
    // fkItemTipo = json['fkItemTipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    // data['fkItemTipoId'] = this.fkItemTipoId;
    // data['fkItemGrupoId'] = this.fkItemGrupoId;
    // data['fkItemTipo'] = this.fkItemTipo;
    return data;
  }

}