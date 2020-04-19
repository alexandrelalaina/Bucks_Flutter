class ProducaoItem {
  int seq; //PK
  int fkProducaoId; //PK
  int fkItemId;
  double qt;
  double vlUnit;
  String cdTipo; // E=Entrada S=Saida
  String cdStatus;

  String descrItem;
  String descrProducao;

  ProducaoItem(this.seq, this.fkProducaoId, this.fkItemId, this.qt, this.vlUnit,
      this.cdTipo, this.cdStatus, this.descrItem, this.descrProducao);

  ProducaoItem.fromJson(Map<String, dynamic> json) {
    fkProducaoId = json['fk_producao_id'];
    seq = json['seq'];
    fkItemId = json['fk_item_id'];
    qt = json['qt'];
    vlUnit = json['vl_unit'];
    cdTipo = json['cd_tipo'];
    cdStatus = json['cd_baixado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fk_producao_id'] = this.fkProducaoId;
    data['seq'] = this.seq;
    data['fk_item_id'] = this.fkItemId;
    data['qt'] = this.qt;
    data['vl_unit'] = this.vlUnit;
    data['cd_tipo'] = this.cdTipo;
    data['cd_status'] = this.cdStatus;
    return data;
  }
}
