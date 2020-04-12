import 'package:bucks/src/pages/item_unmed/widgets/card_item_unmed.dart';
import 'package:bucks/src/shared/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../item_unmed_page.dart';
import 'item_unmed_list_controller.dart';

class ItemUnMedListPage extends StatefulWidget {
  final String title;
  const ItemUnMedListPage({Key key, this.title = "Consulta Unidade de Medida"})
      : super(key: key);

  @override
  _ItemUnMedListPageState createState() => _ItemUnMedListPageState();
}

class _ItemUnMedListPageState extends State<ItemUnMedListPage> {
  ItemUnMedListController store;

  @override
  void initState() {
    super.initState();
    store = ItemUnMedListController();
    store.init();
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
            CardItemUnMedList(store: store),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          push(
              context,
              ItemUnMedPage(
                storeItemUnMedList: store,
              ));
        },
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }
}
