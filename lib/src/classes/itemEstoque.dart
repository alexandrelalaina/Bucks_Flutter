import 'dart:ffi';

import 'package:bucks/src/classes/item.dart';

class ItemEstoque
{
  // chave composta por Item + Lote
  Item fkItemId;
  int lote; // caso nao tenha controle de Lote para cada aquisicao, entao sempre gravar 1 para cada Item
  Double qtSaldo;
  Double vlUnit;
  Double qtReservado;
  
  ItemEstoque(this.fkItemId
    , this.lote
    , this.qtSaldo
    , this.vlUnit
    , this.qtReservado
     );

  ItemEstoque.fromJson(Map<String, dynamic> json) {
    fkItemId = json['fk_item_id'];
    lote = json['lote'];
    qtSaldo = json['qt_saldo'];
    vlUnit = json['vl_unit'];
    qtReservado = json['qt_reservado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fk_item_id'] = this.fkItemId;
    data['lote'] = this.lote;
    data['qt_saldo'] = this.qtSaldo;
    data['vl_unit'] = this.vlUnit;
    data['qt_reservado'] = this.qtReservado;
    return data;
  } 

}