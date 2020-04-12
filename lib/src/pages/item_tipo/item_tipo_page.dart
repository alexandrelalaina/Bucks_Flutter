import 'package:bucks/src/pages/item_tipo/widgets/card_item_tipo.dart';
import 'package:flutter/material.dart';

import 'item_tipo_controller.dart';
import 'item_tipo_list/item_tipo_list_controller.dart';

class ItemTipoPage extends StatefulWidget {
  final String title;
  final ItemTipoListController storeItemTipoList;
  const ItemTipoPage(
      {Key key,
      this.title = "Cadastro Item Tipo",
      @required this.storeItemTipoList})
      : super(key: key);

  @override
  _ItemTipoPageState createState() => _ItemTipoPageState();
}

class _ItemTipoPageState extends State<ItemTipoPage> {
  ItemTipoController store;
  ItemTipoListController get storeItemTipoList => widget.storeItemTipoList;

  @override
  void initState() {
    super.initState();
    store = ItemTipoController();
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
              CardItemTipo(
                store: store,
                storeItemTipoList: storeItemTipoList,
              ),
            ],
          ),
        ));
  }
}
