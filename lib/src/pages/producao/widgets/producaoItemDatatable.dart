import 'package:bucks/src/classes/producao_item.dart';
import 'package:bucks/src/pages/producao/producao_controller.dart';
import 'package:bucks/src/pages/producao/producao_list/producao_list_controller.dart';
import 'package:bucks/src/pages/producao/widgets/datatable_itens_producao.dart';
import 'package:bucks/src/pages/producao/widgets/dropdown_find.dart';
import 'package:bucks/src/shared/utils/colors.dart';
import 'package:bucks/src/shared/widgets/card_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DatatableProducaoItens extends StatefulWidget {
  final ProducaoListController store;
  final ProducaoController store2;

  const DatatableProducaoItens({Key key, this.store, this.store2})
      : super(key: key);
  @override
  _ProducaoControllerState createState() => _ProducaoControllerState();
}

class _ProducaoControllerState extends State<DatatableProducaoItens> {
  ProducaoListController get store => widget.store;
  ProducaoController get store2 => widget.store2;
  bool screen;
  Orientation orientation;
  List<ProducaoItem> itemsList;

  // newList() => store.itemsList = Item.toJsonList(store.itemsDataTable);

  items() {
    return Observer(
      builder: (BuildContext context) {
        // newList();

        if (!store.hasResultsProducaoItem) {
          return Container();
        }

        if (store.producaoItensDt.isEmpty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Nenhum item inserido'),
              ),
            ],
          );
        }

        return DataTableItensProducao(
          itensProducao: store.producaoItensDt, //store.itemsList,
          store: store,
        );
      },
    );
  }

  CardCustom listaItems() {
    List<Widget> list = List();
    list.add(CorDeFundo.ContainerDecorationPadrao(
        text: 'Item', fontSize: 24, fontWeight: FontWeight.bold));
    list.add(SizedBox(height: 10));
    list.add(DropdownFindItemEstoque(
      store: store,
      store2: store2,
    ));

    list.add(CorDeFundo.ContainerDecorationPadrao(
        text: 'Lista Itens de Produção(Entrada / Saída)',
        fontSize: 24,
        fontWeight: FontWeight.bold));
    list.add(items());
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
    final double shortsSide = MediaQuery.of(context).size.shortestSide;
    screen = shortsSide < 600;
    orientation = MediaQuery.of(context).orientation;
    return listaItems();
  }
}
