import 'package:bucks/src/shared/utils/formatar_id_descr.dart';
import 'package:bucks/src/shared/widgets/card_custom.dart';
import 'package:bucks/src/shared/widgets/text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../item_estoque_list_controller.dart';

class CardItemEstoqueList extends StatefulWidget {
  final ItemEstoqueListController store;

  const CardItemEstoqueList({Key key, @required this.store}) : super(key: key);

  @override
  _CardItemEstoqueListState createState() => _CardItemEstoqueListState();
}

class _CardItemEstoqueListState extends State<CardItemEstoqueList> {
  ItemEstoqueListController get store => widget.store;

  CardCustom listaItemEstoque() {
    List<Widget> list = List();
    list.add(
      Observer(builder: (context) {
        if (!store.hasResults) {
          return Container();
        }
        if (store.itemsEstoque.isEmpty) {
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
            DataColumn(label: Text("Item"), numeric: false),
            DataColumn(label: Text("Lote"), numeric: false),
            DataColumn(label: Text("Un."), numeric: false),
            DataColumn(label: Text("Saldo"), numeric: false),
            DataColumn(label: Text("Valor Unit."), numeric: false),
            DataColumn(label: Text("Total"), numeric: false),
            DataColumn(label: Text("Qtd. Reservado"), numeric: false),
          ],
          rows: store.itemsEstoque
              .map(
                (item) => DataRow(
                  cells: [
                    DataCell(Text(item.fkItemId.toString() +
                        ') ' +
                        item.fkItemDescr.toString())),
                    DataCell(Text(item.lote.toString())),
                    DataCell(Text(formatarIdDescr(
                        item.fkItemUnmedId.toString(), item.fkItemUnmedDescr))),
                    DataCell(Text(item.qtSaldo.toString())),
                    DataCell(Text(item.vlUnit.toString())),
                    DataCell(Text((item.qtSaldo * item.vlUnit).toString())),
                    DataCell(Text(item.qtReservado.toString())),
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
    return listaItemEstoque();
  }
}
