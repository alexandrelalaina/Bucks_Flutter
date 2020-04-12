import 'package:bucks/src/pages/item_unmed/item_unmed_list/item_unmed_list_controller.dart';
import 'package:bucks/src/pages/movto_estoque/movto_estoque_tipo/movto_estoque_tipo_list/movto_estoque_tipo_list_controller.dart';
import 'package:bucks/src/shared/widgets/card_custom.dart';
import 'package:bucks/src/shared/widgets/flat_button_app.dart';
import 'package:bucks/src/shared/widgets/text_field_app.dart';
import 'package:bucks/src/shared/widgets/text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../movto_estoque_tipo_controller.dart';

class CardMovtoEstoqueTipo extends StatefulWidget {
  final MovtoEstoqueTipoController store;
  final MovtoEstoqueTipoListController storeMovtoEstoqueTipoList;

  const CardMovtoEstoqueTipo(
      {Key key, @required this.store, @required this.storeMovtoEstoqueTipoList})
      : super(key: key);

  @override
  _CardMovtoEstoqueTipoState createState() => _CardMovtoEstoqueTipoState();
}

class _CardMovtoEstoqueTipoState extends State<CardMovtoEstoqueTipo> {
  MovtoEstoqueTipoController get store => widget.store;
  MovtoEstoqueTipoListController get storeMovtoEstoqueTipoList => widget.storeMovtoEstoqueTipoList;

  CardCustom cadastroMovtoEstoqueTipo() {
    List<Widget> list = List();
    
    list.add(TextFieldApp(
      controller: store.tecDescr,
      text: "Digite a descrição do Tipo de Movto",
    ));
    list.add(SizedBox(height: 10));
    
    list.add(TextFieldApp(
      controller: store.tecCdTipoMovto,
      text: "Digite se o movto é de (E)ntrada ou (S)aída",
    ));
    list.add(SizedBox(height: 10));
    
    list.add(
      Container(
        width: 250,
        child: FlatButtonApp(
          label: "Salvar",
          onPressed: () => store.salvar(store: store, 
                                        storeMovtoEstoqueTipoList: storeMovtoEstoqueTipoList),
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
    return cadastroMovtoEstoqueTipo();
  }
}

class CardMovtoEstoqueTipoList extends StatefulWidget {
  final MovtoEstoqueTipoListController store;

  const CardMovtoEstoqueTipoList({Key key, @required this.store}) : super(key: key);

  @override
  _CardMovtoEstoqueTipoListState createState() => _CardMovtoEstoqueTipoListState();
}

class _CardMovtoEstoqueTipoListState extends State<CardMovtoEstoqueTipoList> {
  MovtoEstoqueTipoListController get store => widget.store;

  CardCustom listaMovtoEstoqueTipo() {
    List<Widget> list = List();
    list.add(
      Observer(builder: (context) {
        if (!store.hasResultsItensUnMed) {
          return Container();
        }
        if (store.movtosEstoqueTipo.isEmpty) {
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
            
            DataColumn(
              label: Text("Tipo Movto"),
              numeric: false,
            ),
            
          ],
          rows: store.movtosEstoqueTipo
              .map(
                (itemTipo) => DataRow(
                  cells: [
                    DataCell(
                      Text(itemTipo.id.toString()),
                    ),
                    
                    DataCell(
                      Text(itemTipo.descr),
                    ),
                    
                    DataCell(
                      Text(itemTipo.cdTipoMovto),
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
    return listaMovtoEstoqueTipo();
  }
}
