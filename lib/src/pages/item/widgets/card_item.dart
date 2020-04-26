import 'package:bucks/src/classes/item_tipo.dart';
import 'package:bucks/src/classes/item.dart';
import 'package:bucks/src/pages/item/item_controller.dart';
import 'package:bucks/src/pages/item/item_list/item_list_controller.dart';
import 'package:bucks/src/pages/item/widgets/buttons.dart';
import 'package:bucks/src/pages/item/widgets/dropdown_find.dart';
import 'package:bucks/src/shared/utils/colors.dart';
import 'package:bucks/src/shared/utils/formatar_id_descr.dart';
import 'package:bucks/src/shared/widgets/card_custom.dart';
import 'package:bucks/src/shared/widgets/text_field_app.dart';
import 'package:bucks/src/shared/widgets/text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CardItem extends StatefulWidget {
  final ItemController store;
  final ItemListController storeItemList;
  BuildContext context;

  CardItem(
      {Key key,
      @required this.store,
      @required this.storeItemList,
      BuildContext context})
      : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  ItemController get store => widget.store;
  ItemListController get storeItemList => widget.storeItemList;
  BuildContext context;

String _validateSenha(String text) {
    if (1 == 1) {
      return "Informe a senha";
    }

    if (text.length <= 2) {
      return "A senha não pode ser menor que 2 números";
    }
    return null;
  }

  CardCustom cadastroItem() {
    List<Widget> list = List();
    //list.add(CorDeFundo.ContainerDecorationPadrao(
    //    text: 'Descrição', fontSize: 20, fontWeight: FontWeight.bold));
    list.add(TextFieldApp(
      controller: store.descricao, 
      text: "Digite a descrição do Item",
    ));

    list.add(TextFieldApp(
      controller: store.cdControlaEstoque,
      text: "Digite o cd. estoque(N=SERVIÇO, S=ESTOQUE, L=LOTE)",
      validator: _validateSenha,
    ));

    list.add(SizedBox(height: 20));
    list.add(CorDeFundo.ContainerDecorationPadrao(
                  text: 'ITEM TIPO', fontSize: 24, fontWeight: FontWeight.bold));
    list.add(DropdownFindItemTipo(
        store: storeItemList
      ));
    list.add(SizedBox(height: 10));

    list.add(CorDeFundo.ContainerDecorationPadrao(
                  text: 'ITEM GRUPO', fontSize: 24, fontWeight: FontWeight.bold));
    list.add(DropdownFindItemGrupo(
        store: storeItemList
      ));
    list.add(SizedBox(height: 10));

    list.add(CorDeFundo.ContainerDecorationPadrao(
                  text: 'ITEM UN. MEDIDA', fontSize: 24, fontWeight: FontWeight.bold));
    list.add(DropdownFindItemUnMed(
        store: storeItemList
      ));
    list.add(SizedBox(height: 10));

    list.add(Buttons(store: store, storeItemList: storeItemList,));
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
    return cadastroItem();
  }

}

class CardItemList extends StatefulWidget {
  final ItemListController store;
  final ItemTipo itemTipo;

  const CardItemList({Key key, @required this.store, @required this.itemTipo}) : super(key: key);

  @override
  _CardItemListState createState() => _CardItemListState();
}

class _CardItemListState extends State<CardItemList> {
  ItemListController get store => widget.store;
  ItemTipo itemTipo;

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

  CardCustom listaItem() {
    List<Widget> list = List();
    list.add(
      Observer(
        builder: (context) {
          if (!store.hasResultsItens) {
            return Container();
          }

          if (store.itens.isEmpty) {
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
                          "ID",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        numeric: false,
                      ),
                      DataColumn(
                          label: Text(
                            "DESCR",
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
                            "CD EST.",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          numeric: false,
                         ),
                          DataColumn(
                          label: Text(
                            "ITEM TIPO",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          DataColumn(
                          label: Text(
                            "ITEM GRUPO",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          DataColumn(
                          label: Text(
                            "ITEM UN. MED.",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                    ],
                    rows: store.itens.map((item) {
                       
                      // var item = Item.fromJson(data);

                      return DataRow(cells: [
                        DataCell(
                          Text(
                            "${item.id}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${item.descr}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${item.cdControlaEstoque}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DataCell(
                          Text(
                            formatarIdDescr(item.fkItemTipoId.toString(), item.itemTipoDescr),
                            // "${item.itemTipoDescr}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DataCell(
                          Text(formatarIdDescr(item.fkItemGrupoId.toString(), item.itemGrupoDescr),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        DataCell(
                          Text(formatarIdDescr(item.fkItemUnmedId, item.itemUnMedDescr),
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
    return listaItem();
  }
}
