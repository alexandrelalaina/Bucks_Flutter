import 'package:flutter/material.dart';

import 'item_unmed_controller.dart';
import 'item_unmed_list/item_unmed_list_controller.dart';
import 'widgets/card_item_unmed.dart';

class ItemUnMedPage extends StatefulWidget {
  final String title;
  final ItemUnMedListController storeItemUnMedList;
  const ItemUnMedPage(
      {Key key,
      this.title = "Cadastro de Unidade de Medida",
      @required this.storeItemUnMedList})
      : super(key: key);

  @override
  _ItemUnMedPageState createState() => _ItemUnMedPageState();
}

class _ItemUnMedPageState extends State<ItemUnMedPage> {
  ItemUnMedController store;
  ItemUnMedListController get storeItemUnMedList => widget.storeItemUnMedList;

  @override
  void initState() {
    super.initState();
    store = ItemUnMedController();
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
              CardItemUnMed(
                store: store,
                storeItemUnMedList: storeItemUnMedList,
              ),
            ],
          ),
        ));
  }
}
