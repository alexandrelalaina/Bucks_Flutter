import 'package:bucks/src/classes/item.dart';
import 'package:bucks/src/pages/producao_item/producao_item_controller.dart';
import 'package:bucks/src/pages/producao_item/producao_item_list/producao_item_list_controller.dart';
import 'package:bucks/src/pages/producao_item/widgets/buttons.dart';
import 'package:bucks/src/pages/producao_item/widgets/dropdown_find.dart';
import 'package:bucks/src/shared/utils/colors.dart';
import 'package:bucks/src/shared/widgets/card_custom.dart';
import 'package:bucks/src/shared/widgets/text_field_app.dart';
import 'package:bucks/src/shared/widgets/text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CardProducaoItem extends StatefulWidget {
  final ProducaoItemController store;
  final ProducaoItemListController storeProducaoItemList;
  BuildContext context;

  CardProducaoItem(
      {Key key,
      @required this.store,
      @required this.storeProducaoItemList,
      BuildContext context})
      : super(key: key);

  @override
  _CardProducaoItemState createState() => _CardProducaoItemState();
}

class _CardProducaoItemState extends State<CardProducaoItem> {
  ProducaoItemController get store => widget.store;
  ProducaoItemListController get storeProducaoItemList =>
      widget.storeProducaoItemList;
  BuildContext context;

  CardCustom cadastroProducaoItem() {
    List<Widget> list = List();
    //list.add(CorDeFundo.ContainerDecorationPadrao(
    //    text: 'Descrição', fontSize: 20, fontWeight: FontWeight.bold));
    list.add(CorDeFundo.ContainerDecorationPadrao(
        text: 'ITEM', fontSize: 24, fontWeight: FontWeight.bold));
    list.add(DropdownFindItem(store: storeProducaoItemList));

    list.add(CorDeFundo.ContainerDecorationPadrao(
        text: 'PRODUÇÃO', fontSize: 24, fontWeight: FontWeight.bold));
    list.add(DropdownFindProducao(store: storeProducaoItemList));

    list.add(TextFieldApp(
      controller: store.qt,
      text: "Digite a quantidade",
    ));

    list.add(TextFieldApp(
      controller: store.vlUnit,
      text: "Digite o valor unitário",
    ));

    list.add(TextFieldApp(
      controller: store.cdTipoEntSai,
      text: "Digite o cd. tipo (E = ENTRADA, S = SAÍDA)",
    ));

    list.add(TextFieldApp(
      controller: store.cdStatus,
      text: "Digite o status",
    ));

    list.add(Buttons(
      store: store,
      storeProducaoItemList: storeProducaoItemList,
    ));
    /*list.add(
      Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
      ),
      margin: EdgeInsets.only(top: 20),
      child: Container(
                width: 550,
                child:  AppButton(
                "Salvarrr",
                validaItem(data: store, storeItemList: storeItemList),
              ),
                /*FlatButtonApp(
                  label: "Salvar",
                  onPressed: () => validaItem(data: store, storeItemList: storeItemList),
                ),*/
              ),
      ),
    );*/

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
    return cadastroProducaoItem();
  }
}

class CardProducaoItemList extends StatefulWidget {
  final ProducaoItemListController store;
  //final ItemTipo itemTipo;

  const CardProducaoItemList({Key key, @required this.store}) : super(key: key);

  @override
  _CardProducaoItemListState createState() => _CardProducaoItemListState();
}

class _CardProducaoItemListState extends State<CardProducaoItemList> {
  ProducaoItemListController get store => widget.store;
  //ItemTipo itemTipo;

  //dynamic get store => widget.store;
  bool sort = false;

  List<Item> itens;

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 1) {
      if (ascending) {
        store.itens.sort((a, b) => a.descr.compareTo(b.descr));
      } else {
        store.itens.sort((a, b) => b.descr.compareTo(a.descr));
      }
    }
  }

  CardCustom listaProducaoItem() {
    List<Widget> list = List();
    list.add(
      Observer(
        builder: (context) {
          if (!store.hasResultsProducaoItem) {
            return Container();
          }

          if (store.producaoItens.isEmpty) {
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

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.blue,
                scaffoldBackgroundColor: Colors.blue,
              ),
              child: Column(
                children: <Widget>[
                  DataTable(
                    sortAscending: sort,
                    sortColumnIndex: 1,
                    columns: [
                      DataColumn(
                        label: Text(
                          "SEQ.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                          label: Text(
                            "PRODUÇÃO",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          numeric: false,
                          onSort: (columnIndex, ascending) {
                            setState(() {
                              sort = !sort;
                            });
                            onSortColum(columnIndex, ascending);
                          }),
                      DataColumn(
                        label: Text(
                          "ITEM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "QT.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "VL. UNIT.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "CD. TIPO",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "CD. STATUS.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                    rows: store.producaoItens.map((item) {
                      // var item = Item.fromJson(data);

                      return DataRow(cells: [
                        DataCell(
                          Text(
                            "${item.seq}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${item.descrProducao}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${item.descrItem}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${item.qt}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${item.vlUnit}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${item.cdTipo}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${item.cdStatus}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ]);
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    /*return DataTable(
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
          rows: store.itens
              .map( 
                (item) => DataRow(
                  cells: [
                    DataCell(
                      Text(item.id.toString()),
                    ),
                    DataCell(
                      Text(item.descricao.toString()),
                    ),
                  ],
                ),
              )
              .toList(),
        );*/

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
    return listaProducaoItem();
  }
}
