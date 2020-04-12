import 'dart:ffi';

import 'package:bucks/src/classes/itemEstoque.dart';

class MovtoEstoque{

  int id;
  ItemEstoque itemEstoque;
  int fkMovtoEstoqueTipoId;
  String dt;
  Double qtd;
  Double vlUnit;
  Double qtSaldoAnt;
  Double qtSaldoPos;
  Double vlUnitAnt;
  Double vlUnitPos;

  MovtoEstoque(this.id, this.itemEstoque, this.fkMovtoEstoqueTipoId, this.dt, this.vlUnit);

  MovtoEstoque.fromJson(Map<String, dynamic> json){
    id = json['id'];
    itemEstoque = json['item_estoque'];
    fkMovtoEstoqueTipoId = json['fk_movto_estoque_tipo_id'];
    dt = json['dt'];
    qtd = json['qtd'];
    vlUnit = json['vl_unit'];
    qtSaldoAnt = json['qt_saldo_ant'];
    qtSaldoPos = json['qt_saldo_pos'];
    vlUnitAnt = json['vl_unit_ant'];
    vlUnitPos = json['vl_unit_pos'];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id; 
    data['item_estoque'] = this.itemEstoque; 
    data['fk_movto_estoque_tipo_id'] = this.fkMovtoEstoqueTipoId; 
    data['dt'] = this.dt; 
    data['qtd'] = this.qtd; 
    data['vl_unit'] = this.vlUnit; 
    data['qt_saldo_ant'] = this.qtSaldoAnt; 
    data['qt_saldo_pos'] = this.qtSaldoPos; 
    data['vl_unit_ant'] = this.vlUnitAnt; 
    data['vl_unit_pos'] = this.vlUnitPos; 

  }


}