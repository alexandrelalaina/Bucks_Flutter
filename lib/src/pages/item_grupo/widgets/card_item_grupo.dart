import 'package:bucks/src/pages/item_grupo/item_grupo_controller.dart';
import 'package:bucks/src/pages/item_grupo/item_grupo_list/item_grupo_list_controller.dart';
import 'package:bucks/src/shared/widgets/card_custom.dart';
import 'package:bucks/src/shared/widgets/flat_button_app.dart';
import 'package:bucks/src/shared/widgets/text_field_app.dart';
import 'package:bucks/src/shared/widgets/text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CardItemGrupo extends StatefulWidget {
  final ItemGrupoController store;
  final ItemGrupoListController storeItemGrupoList;

  const CardItemGrupo(
      {Key key, @required this.store, @required this.storeItemGrupoList})
      : super(key: key);

  @override
  _CardItemGrupoState createState() => _CardItemGrupoState();
}

class _CardItemGrupoState extends State<CardItemGrupo> {
  ItemGrupoController get store => widget.store;
  ItemGrupoListController get storeItemGrupoList => widget.storeItemGrupoList;

  CardCustom cadastroItemGrupo() {
    List<Widget> list = List();
    list.add(TextFieldApp(
      controller: store.descr,
      text: "Digite a descrição do Grupo do Item",
    ));
    list.add(SizedBox(height: 10));
    list.add(
      Container(
        width: 250,
        child: FlatButtonApp(
          label: "Salvar",
          onPressed: () => store.salvar(
              store: store, storeItemGrupoList: storeItemGrupoList),
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
    return cadastroItemGrupo();
  }
}

class CardItemGrupoList extends StatefulWidget {
  final ItemGrupoListController store;

  const CardItemGrupoList({Key key, @required this.store}) : super(key: key);

  @override
  _CardItemGrupoListState createState() => _CardItemGrupoListState();
}

class _CardItemGrupoListState extends State<CardItemGrupoList> {
  ItemGrupoListController get store => widget.store;

  CardCustom listaItemGrupo() {
    List<Widget> list = List();
    list.add(
      Observer(builder: (context) {
        if (!store.hasResultsItensGrupo) {
          return Container();
        }
        if (store.itensGrupo.isEmpty) {
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
          rows: store.itensGrupo
              .map(
                (itemGrupo) => DataRow(
                  cells: [
                    DataCell(
                      Text(itemGrupo.id.toString()),
                    ),
                    DataCell(
                      Text(itemGrupo.descr),
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
    return listaItemGrupo();
  }
}
