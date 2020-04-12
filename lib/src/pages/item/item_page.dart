import 'package:bucks/src/pages/item/item_controller.dart';
import 'package:bucks/src/pages/item/widgets/card_item.dart';
import 'package:flutter/material.dart';

import 'item_list/item_list_controller.dart';

class ItemPage extends StatefulWidget {
  final String title;
  final ItemListController storeItemList;
  const ItemPage(
      {Key key,
      this.title = "Cadastro Item",
      @required this.storeItemList})
      : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  ItemController store;
  ItemListController get storeItemList => widget.storeItemList;

  @override
  void initState() {
    super.initState();
    store = ItemController();
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
              CardItem(
                store: store,
                storeItemList: storeItemList,
              ),
              //Buttons(store: store, storeItemList: storeItemList,),
            ],
          ),
        ));
  }
}
