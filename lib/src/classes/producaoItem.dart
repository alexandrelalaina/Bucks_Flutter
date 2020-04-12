import 'dart:ffi';
import 'package:bucks/src/classes/producao.dart';
import 'item.dart';

class ProducaoItem
{
  Producao fkProducaoId; //PK
  int seq;               //PK
  Item fkItemId;
  Double qt;
  Double vlUnit;
  String cdTipo;    // E=Entrada S=Saida
  String cdBaixado;
  
  ProducaoItem(this.fkProducaoId,
               this.seq, 
               this.fkItemId,
               this.qt,
               this.vlUnit,
               this.cdTipo,
               this.cdBaixado,
     );

  ProducaoItem.fromJson(Map<String, dynamic> json) {
    fkProducaoId = json['fk_producao_id'];
    seq = json['seq'];
    fkItemId = json['fk_item_id'];
    qt = json['qt'];
    vlUnit = json['vl_unit'];
    cdTipo = json['cd_tipo'];
    cdBaixado = json['cd_baixado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fk_producao_id'] = this.fkProducaoId;
    data['seq'] = this.seq;
    data['fk_item_id'] = this.fkItemId;
    data['qt'] = this.qt;
    data['vl_unit'] = this.vlUnit;
    data['cd_tipo'] = this.cdTipo;
    data['cd_baixado'] = this.cdBaixado;
    return data;
  }

}