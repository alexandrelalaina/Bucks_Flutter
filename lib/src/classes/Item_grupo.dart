class ItemGrupo
{
  int id;
  String descricao;
  
  ItemGrupo(this.id, this.descricao);

  ItemGrupo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    return data;
  }

}