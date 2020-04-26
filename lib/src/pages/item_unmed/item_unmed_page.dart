import 'package:flutter/material.dart';

import 'item_unmed_controller.dart';
import 'item_unmed_list/item_unmed_list_controller.dart';
import 'widgets/card_item_unmed.dart';

class ItemUnmedPage extends StatefulWidget {
  final String title;
  final ItemUnmedListController storeItemUnmedList;
  const ItemUnmedPage(
      {Key key,
      this.title = "Cadastro de Unidade de Medida",
      @required this.storeItemUnmedList})
      : super(key: key);

  @override
  _ItemUnmedPageState createState() => _ItemUnmedPageState();
}

class _ItemUnmedPageState extends State<ItemUnmedPage> {
  ItemUnmedController store;
  ItemUnmedListController get storeItemUnmedList => widget.storeItemUnmedList;

  @override
  void initState() {
    super.initState();
    store = ItemUnmedController();
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
              CardItemUnmed(
                store: store,
                storeItemUnmedList: storeItemUnmedList,
              ),
            ],
          ),
        ));
  }
}
