import 'package:bucks/src/pages/producao_item/producao_item_controller.dart';
import 'package:bucks/src/pages/producao_item/widgets/card_producao_item.dart';
import 'package:flutter/material.dart';

import 'producao_item_list/producao_item_list_controller.dart';

class ProducaoItemPage extends StatefulWidget {
  final String title;
  final ProducaoItemListController storeProducaoItemList;
  const ProducaoItemPage(
      {Key key,
      this.title = "Cadastro Produção Item",
      @required this.storeProducaoItemList})
      : super(key: key);

  @override
  _ProducaoItemPageState createState() => _ProducaoItemPageState();
}

class _ProducaoItemPageState extends State<ProducaoItemPage> {
  ProducaoItemController store;
  ProducaoItemListController get storeProducaoItemList =>
      widget.storeProducaoItemList;

  @override
  void initState() {
    super.initState();
    store = ProducaoItemController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              CardProducaoItem(
                store: store,
                storeProducaoItemList: storeProducaoItemList,
              ),
              //Buttons(store: store, storeItemList: storeItemList,),
            ],
          ),
        ));
  }
}
