import 'package:bucks/src/pages/item_unmed/item_unmed_list/item_unmed_list_controller.dart';
import 'package:bucks/src/shared/widgets/card_custom.dart';
import 'package:bucks/src/shared/widgets/flat_button_app.dart';
import 'package:bucks/src/shared/widgets/text_field_app.dart';
import 'package:bucks/src/shared/widgets/text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../item_unmed_controller.dart';

class CardItemUnMed extends StatefulWidget {
  final ItemUnMedController store;
  final ItemUnMedListController storeItemUnMedList;

  const CardItemUnMed(
      {Key key, @required this.store, @required this.storeItemUnMedList})
      : super(key: key);

  @override
  _CardItemUnMedState createState() => _CardItemUnMedState();
}

class _CardItemUnMedState extends State<CardItemUnMed> {
  ItemUnMedController get store => widget.store;
  ItemUnMedListController get storeItemUnMedList => widget.storeItemUnMedList;

  CardCustom cadastroItemUnMed() {
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
                                        storeItemUnMedList: storeItemUnMedList),
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
    return cadastroItemUnMed();
  }
}

class CardItemUnMedList extends StatefulWidget {
  final ItemUnMedListController store;

  const CardItemUnMedList({Key key, @required this.store}) : super(key: key);

  @override
  _CardItemUnMedListState createState() => _CardItemUnMedListState();
}

class _CardItemUnMedListState extends State<CardItemUnMedList> {
  ItemUnMedListController get store => widget.store;

  CardCustom listaItemUnMed() {
    List<Widget> list = List();
    list.add(
      Observer(builder: (context) {
        if (!store.hasResultsItensUnMed) {
          return Container();
        }
        if (store.itensUnMed.isEmpty) {
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
          rows: store.itensUnMed
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
    return listaItemUnMed();
  }
}
