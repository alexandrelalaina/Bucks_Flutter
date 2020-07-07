import 'package:bucks/src/pages/movto_estoque/movto_estoque_controller.dart';
import 'package:bucks/src/pages/movto_estoque/movto_estoque_list_controller.dart';
import 'package:bucks/src/pages/movto_estoque/widgets/buttons.dart';
import 'package:bucks/src/pages/movto_estoque/widgets/dropdown_find_item.dart';
import 'package:bucks/src/pages/movto_estoque/widgets/dropdown_find_item_estoque.dart';
import 'package:bucks/src/pages/movto_estoque/widgets/dropdown_find_movto_estoque_tipo.dart';
import 'package:bucks/src/shared/utils/colors.dart';
import 'package:bucks/src/shared/utils/constants.dart';
import 'package:bucks/src/shared/utils/formatar_id_descr.dart';
import 'package:bucks/src/shared/widgets/card_custom.dart';
import 'package:bucks/src/shared/widgets/text_field_app.dart';
import 'package:bucks/src/shared/widgets/text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';

class CardMovtoEstoque extends StatefulWidget {
  final MovtoEstoqueController store;
  final MovtoEstoqueListController storeMovtoEstoqueList;
  BuildContext context;

  CardMovtoEstoque(
      {Key key,
      @required this.store,
      @required this.storeMovtoEstoqueList,
      BuildContext context})
      : super(key: key);

  @override
  _CardMovtoEstoqueState createState() => _CardMovtoEstoqueState();
}

class _CardMovtoEstoqueState extends State<CardMovtoEstoque> {
  MovtoEstoqueController get store => widget.store;
  MovtoEstoqueListController get storeMovtoEstoqueList =>
      widget.storeMovtoEstoqueList;
  BuildContext context;

  CardCustom cadastroMovtoEstoque() {
    List<Widget> list = List();

    list.add(CorDeFundo.ContainerDecorationPadrao(
      text: 'TIPO MOVTO ESTOQUE',
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ));
    list.add(DropdownFindMovtoTipo(store: storeMovtoEstoqueList));

    list.add(Divider(color: Colors.red));
    list.add(Text('***ajustar LOV a ser mostrada... ITEM ou ITEM_ESTOQUE'));
    list.add(Divider(color: Colors.red));

    // if (storeMovtoEstoqueList.lovMovtoEstoqueTipoSelected.cdTipoMovto == "E") {
    // if (storeMovtoEstoqueList.lovMovtoEstoqueTipoSelected != null) {
    // if (storeMovtoEstoqueList.lovMovtoEstoqueTipoSelected.cdTipoMovto ==
    //     "E") {
    list.add(CorDeFundo.ContainerDecorationPadrao(
      text: 'ITEM',
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ));
    list.add(DropdownFindItem(store: storeMovtoEstoqueList));
    // list.add(Observer(
    //   builder: (BuildContext context) {
    //     return DropdownFindItem(store: storeMovtoEstoqueList);
    //   },
    // ));
    // list.add(DropdownFindItem(store: storeMovtoEstoqueList));
    // } else {
    list.add(CorDeFundo.ContainerDecorationPadrao(
      text: 'ITEM DO ESTOQUE',
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ));
    list.add(DropdownFindItemEstoque(
      storeList: storeMovtoEstoqueList,
      storePage: store,
    ));
    // }
    // }

    list.add(TextFieldApp(
      controller: store.lote,
      text: "Digite o Lote",
      pEnabled: false,
    ));

    store.qtd = MaskedTextController(mask: maskValor);
    store.qtd.text = '1';
    list.add(TextFieldApp(
      controller: store.qtd,
      text: "Digite a quantidade",
    ));

    list.add(TextFieldApp(
      controller: store.dt,
      text: "Digite a data do Movto",
    ));

    // list.add(TextFieldApp(
    //   controller: store.vlTotal,
    //   text: "Digite o valor total",
    //   // onChange: store.calcular,
    // ));

    list.add(TextFieldApp(
      controller: store.vlUnit,
      text: "Digite o valor unitário",
      // onChange: store.calcular,
      // pEnabled: false,
    ));

    list.add(Buttons(
      store: store,
      storeMovtoEstoqueList: storeMovtoEstoqueList,
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
    return cadastroMovtoEstoque();
  }
}

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
            DataColumn(label: Text("ID"), numeric: false),
            DataColumn(label: Text("ITEM"), numeric: false),
            DataColumn(label: Text("LOTE"), numeric: false),
            DataColumn(label: Text("TIPO"), numeric: false),
            DataColumn(label: Text("DATA"), numeric: false),
            DataColumn(label: Text("QTD"), numeric: false),
            DataColumn(label: Text("VL_UNIT"), numeric: false),
            DataColumn(label: Text("Vl. Total"), numeric: false),
            DataColumn(label: Text("QT_SALDO_ANT"), numeric: false),
            DataColumn(label: Text("QT_SALDO_POS"), numeric: false),
            DataColumn(label: Text("VL_UNIT_ANT"), numeric: false),
            DataColumn(label: Text("VL_UNIT_POS"), numeric: false),
            DataColumn(label: Text("PRODUCAO ID"), numeric: false),
            DataColumn(label: Text("PRODUCAO SEQ"), numeric: false),
          ],
          rows: store.movtosEstoque
              .map(
                (item) => DataRow(
                  cells: [
                    DataCell(Text(item.id.toString())),
                    DataCell(Text(formatarIdDescr(
                        item.fkItemEstoqueItemId.toString(),
                        item.fkItemEstoqueItemDescr))),
                    DataCell(Text(item.fkItemEstoqueLote.toString())),
                    DataCell(Text(formatarIdDescr(
                        item.fkMovtoEstoqueTipoId.toString(),
                        item.fkMovtoEstoqueTipoDescr))),
                    DataCell(Text(item.dt.toString())),
                    DataCell(Text(item.qtd.toString())),
                    DataCell(Text(item.vlUnit.toString())),
                    DataCell(Text((item.qtd * item.vlUnit).toString())),
                    DataCell(Text(item.qtSaldoAnt.toString())),
                    DataCell(Text(item.qtSaldoPos.toString())),
                    DataCell(Text(item.vlUnitAnt.toString())),
                    DataCell(Text(item.vlUnitPos.toString())),
                    DataCell(Text(item.fkProditemProducaoId.toString())),
                    DataCell(Text(item.fkProditemSeq.toString())),
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
    //       onPressed: () => store.sa(store: store),
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
