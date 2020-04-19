import 'package:bucks/src/shared/widgets/card_custom.dart';
import 'package:bucks/src/shared/widgets/text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../movto_estoque_list_controller.dart';

class CardMovtoEstoqueList extends StatefulWidget {
  final MovtoEstoqueListController store;

  const CardMovtoEstoqueList({Key key, @required this.store}) : super(key: key);

  @override
  _CardMovtoEstoqueListState createState() => _CardMovtoEstoqueListState();
}

class _CardMovtoEstoqueListState extends State<CardMovtoEstoqueList> {
  MovtoEstoqueListController get store => widget.store;

  CardCustom listaMovtoEstoque() {
    List<Widget> list = List();
    list.add(
      Observer(builder: (context) {
        if (!store.hasResults) {
          return Container();
        }
        if (store.movtosEstoque.isEmpty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextMessage(
                'Nenhum item encontrado. \nClique aqui para tentar novamente.',
                fontSize: 18,
                // onRefresh: store.fetchItems,
              ),
            ],
          );
        }
        return DataTable(
          columns: [
            DataColumn(label: Text("ID"),numeric: false,),
            DataColumn(label: Text("ITEM"),numeric: false,),
            DataColumn(label: Text("LOTE"),numeric: false,),
            DataColumn(label: Text("TIPO"),numeric: false,),
            DataColumn(label: Text("DATA"),numeric: false,),
            DataColumn(label: Text("QTD"),numeric: false,),
            DataColumn(label: Text("VL_UNIT"),numeric: false,),
            DataColumn(label: Text("QT_SALDO_ANT"),numeric: false,),
            DataColumn(label: Text("QT_SALDO_POS"),numeric: false,),
            DataColumn(label: Text("VL_UNIT_ANT"),numeric: false,),
            DataColumn(label: Text("VL_UNIT_POS"),numeric: false,),
            DataColumn(label: Text("PRODUCAO ID"),numeric: false,),
            DataColumn(label: Text("PRODUCAO SEQ"),numeric: false,),
          ],
          rows: store.movtosEstoque
              .map(
                (item) => DataRow(
                  cells: [
                    DataCell(Text(item.id.toString()),),
                    DataCell(Text(item.fkItemEstoqueItemId.toString()),),
                    DataCell(Text(item.fkItemEstoqueLote.toString()),),
                    DataCell(Text(item.fkMovtoEstoqueTipoId.toString()),),
                    DataCell(Text(item.dt.toString()),),
                    DataCell(Text(item.qtd.toString()),),
                    DataCell(Text(item.vlUnit.toString()),),
                    DataCell(Text(item.qtSaldoAnt.toString()),),
                    DataCell(Text(item.qtSaldoPos.toString()),),
                    DataCell(Text(item.vlUnitAnt.toString()),),
                    DataCell(Text(item.vlUnitPos.toString()),),
                    DataCell(Text(item.fkProditemProducaoId.toString()),),
                    DataCell(Text(item.fkProditemSeq.toString()),),
                  ],
                ),
              )
              .toList(),
        );
      }),
    );
    // list.add(SizedBox(height: 10));
    // list.add(
    //   Container(
    //     width: 250,
    //     child: FlatButtonApp(
    //       label: "Salvar",
    //       onPressed: () => store.salvarFarmacia(store: store),
    //     ),
    //   ),
    // );

    return CardCustom(
      padding: 20,
      borderRadius: 15.0,
      widget: Column(
        children: list,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return listaMovtoEstoque();
  }
}
