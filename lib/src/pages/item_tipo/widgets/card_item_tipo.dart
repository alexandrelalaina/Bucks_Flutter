import 'package:bucks/src/pages/item_tipo/item_tipo_list/item_tipo_list_controller.dart';
import 'package:bucks/src/shared/widgets/card_custom.dart';
import 'package:bucks/src/shared/widgets/flat_button_app.dart';
import 'package:bucks/src/shared/widgets/text_field_app.dart';
import 'package:bucks/src/shared/widgets/text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../item_tipo_controller.dart';

class CardItemTipo extends StatefulWidget {
  final ItemTipoController store;
  final ItemTipoListController storeItemTipoList;

  const CardItemTipo(
      {Key key, @required this.store, @required this.storeItemTipoList})
      : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItemTipo> {
  ItemTipoController get store => widget.store;
  ItemTipoListController get storeItemTipoList => widget.storeItemTipoList;

  CardCustom cadastroItemTipo() {
    List<Widget> list = List();
    list.add(TextFieldApp(
      controller: store.descr,
      text: "Digite a descrição do Tipo do Item",
    ));
    list.add(SizedBox(height: 10));
    list.add(
      Container(
        width: 250,
        child: FlatButtonApp(
          label: "Salvar",
          onPressed: () => store.salvarItemTipo(
              store: store, storeItemTipoList: storeItemTipoList),
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
    return cadastroItemTipo();
  }
}

class CardItemTipoList extends StatefulWidget {
  final ItemTipoListController store;

  const CardItemTipoList({Key key, @required this.store}) : super(key: key);

  @override
  _CardItemTipoListState createState() => _CardItemTipoListState();
}

class _CardItemTipoListState extends State<CardItemTipoList> {
  ItemTipoListController get store => widget.store;

  CardCustom listaItemTipo() {
    List<Widget> list = List();
    list.add(
      Observer(builder: (context) {
        if (!store.hasResultsItensTipo) {
          return Container();
        }
        if (store.itensTipo.isEmpty) {
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
          rows: store.itensTipo
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
    return listaItemTipo();
  }
}
