import 'entity_base.dart';

class MovtoEstoque extends EntityBase{

  int id;
  int fkItemEstoqueItemId;
  int fkItemEstoqueLote;
  int fkMovtoEstoqueTipoId;
  String dt;
  double qtd;
  double vlUnit;
  double qtSaldoAnt;
  double qtSaldoPos;
  double vlUnitAnt;
  double vlUnitPos;
  int fkProditemProducaoId;
  int fkProditemSeq;

  MovtoEstoque(
      {this.id,
      this.fkItemEstoqueItemId,
      this.fkItemEstoqueLote,
      this.fkMovtoEstoqueTipoId,
      this.dt,
      this.qtd,
      this.vlUnit,
      this.qtSaldoAnt,
      this.qtSaldoPos,
      this.vlUnitAnt,
      this.vlUnitPos,
      this.fkProditemProducaoId,
      this.fkProditemSeq});

  MovtoEstoque.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fkItemEstoqueItemId = json['fk_item_estoque_item_id'];
    fkItemEstoqueLote = json['fk_item_estoque_lote'];
    fkMovtoEstoqueTipoId = json['fk_movto_estoque_tipo_id'];
    dt = json['dt'];
    qtd = json['qtd'];
    vlUnit = json['vl_unit'];
    qtSaldoAnt = json['qt_saldo_ant'];
    qtSaldoPos = json['qt_saldo_pos'];
    vlUnitAnt = json['vl_unit_ant'];
    vlUnitPos = json['vl_unit_pos'];
    fkProditemProducaoId = json['fk_proditem_producao_id'];
    fkProditemSeq = json['fk_proditem_seq'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fk_item_estoque_item_id'] = this.fkItemEstoqueItemId;
    data['fk_item_estoque_lote'] = this.fkItemEstoqueLote;
    data['fk_movto_estoque_tipo_id'] = this.fkMovtoEstoqueTipoId;
    data['dt'] = this.dt;
    data['qtd'] = this.qtd;
    data['vl_unit'] = this.vlUnit;
    data['qt_saldo_ant'] = this.qtSaldoAnt;
    data['qt_saldo_pos'] = this.qtSaldoPos;
    data['vl_unit_ant'] = this.vlUnitAnt;
    data['vl_unit_pos'] = this.vlUnitPos;
    data['fk_proditem_producao_id'] = this.fkProditemProducaoId;
    data['fk_proditem_seq'] = this.fkProditemSeq;
    return data;
  }
}