import 'package:bucks/src/pages/producao/producao_controller.dart';
import 'package:bucks/src/pages/producao/producao_list/producao_list_controller.dart';
import 'package:bucks/src/pages/producao/widgets/card_producao_item.dart';
import 'package:bucks/src/pages/producao/widgets/datatable_itens_producao.dart';
import 'package:bucks/src/shared/utils/colors.dart';
import 'package:bucks/src/shared/widgets/card_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProducaoItensDt extends StatefulWidget {
  final ProducaoController store;
  final ProducaoListController storeProducaoListController;

  const ProducaoItensDt({Key key, this.store, this.storeProducaoListController})
      : super(key: key);
  @override
  _ProducaoItensDtState createState() => _ProducaoItensDtState();
}

class _ProducaoItensDtState extends State<ProducaoItensDt> {
  ProducaoController get store => widget.store;
  ProducaoListController get storeProducaoListController =>
      widget.storeProducaoListController;
  bool screen;
  Orientation orientation;
  // List<Item> itemsList;

  // newList() => store.itemsList = Item.toJsonList(store.itemsDataTable);

  items() {
    return Observer(
      builder: (BuildContext context) {
        // newList();

        if (!storeProducaoListController.hasResultsProducaoItemDt) {
          return Container();
        }

        if (storeProducaoListController.producaoItensDt.isEmpty) {
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
          itensProducao: storeProducaoListController.producaoItensDt,
          store: storeProducaoListController,
        );
      },
    );
  }

  CardCustom listaItems() {
    List<Widget> list = List();
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
