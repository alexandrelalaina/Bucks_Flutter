import 'package:bucks/src/pages/item_unmed/item_unmed_list/item_unmed_list_controller.dart';
import 'package:bucks/src/shared/widgets/card_custom.dart';
import 'package:bucks/src/shared/widgets/flat_button_app.dart';
import 'package:bucks/src/shared/widgets/text_field_app.dart';
import 'package:bucks/src/shared/widgets/text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../item_unmed_controller.dart';

class CardItemUnmed extends StatefulWidget {
  final ItemUnmedController store;
  final ItemUnmedListController storeItemUnmedList;

  const CardItemUnmed(
      {Key key, @required this.store, @required this.storeItemUnmedList})
      : super(key: key);

  @override
  _CardItemUnmedState createState() => _CardItemUnmedState();
}

class _CardItemUnmedState extends State<CardItemUnmed> {
  ItemUnmedController get store => widget.store;
  ItemUnmedListController get storeItemUnmedList => widget.storeItemUnmedList;

  CardCustom cadastroItemUnmed() {
    List<Widget> list = List();
    list.add(TextFieldApp(
      controller: store.id,
      text: "Digite o código da Unidade de Medida",      
    ));
    list.add(SizedBox(height: 10));
    list.add(TextFieldApp(
      controller: store.descr,
      text: "Digite a descrição da Unidade de Medida",
    ));
    list.add(SizedBox(height: 10));
    list.add(
      Container(
        width: 250,
        child: FlatButtonApp(
          label: "Salvar",
          onPressed: () => store.salvar(store: store, 
                                        storeItemUnmedList: storeItemUnmedList),
        ),
      ),
    );

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
    return cadastroItemUnmed();
  }
}

class CardItemUnmedList extends StatefulWidget {
  final ItemUnmedListController store;

  const CardItemUnmedList({Key key, @required this.store}) : super(key: key);

  @override
  _CardItemUnmedListState createState() => _CardItemUnmedListState();
}

class _CardItemUnmedListState extends State<CardItemUnmedList> {
  ItemUnmedListController get store => widget.store;

  CardCustom listaItemUnmed() {
    List<Widget> list = List();
    list.add(
      Observer(builder: (context) {
        if (!store.hasResultsItensUnmed) {
          return Container();
        }
        if (store.itensUnmed.isEmpty) {
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
            DataColumn(
              label: Text("ID"),
              numeric: false,
            ),
            DataColumn(
              label: Text("DESCRIÇÃO"),
              numeric: false,
            ),
          ],
          rows: store.itensUnmed
              .map(
                (itemTipo) => DataRow(
                  cells: [
                    DataCell(
                      Text(itemTipo.id.toString()),
                    ),
                    DataCell(
                      Text(itemTipo.descr),
                    ),
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
    return listaItemUnmed();
  }
}
