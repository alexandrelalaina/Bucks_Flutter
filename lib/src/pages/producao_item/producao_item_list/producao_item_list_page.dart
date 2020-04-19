import 'package:bucks/src/pages/producao_item/producao_item_list/producao_item_list_controller.dart';
import 'package:bucks/src/pages/producao_item/producao_item_page.dart';
import 'package:bucks/src/pages/producao_item/widgets/card_producao_item.dart';
import 'package:bucks/src/shared/utils/colors.dart';
import 'package:bucks/src/shared/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProducaoItemListPage extends StatefulWidget {
  final String title;
  const ProducaoItemListPage({Key key, this.title = "Consulta Item"})
      : super(key: key);

  @override
  _ProducaoItemListPageState createState() => _ProducaoItemListPageState();
}

class _ProducaoItemListPageState extends State<ProducaoItemListPage> {
  ProducaoItemListController store;
  //ItemTipo itemTipo;

  @override
  void initState() {
    super.initState();
    store = ProducaoItemListController();
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
            SizedBox(height: 15),
            CorDeFundo.ContainerDecorationPadrao(
                text: 'PRODUÇÃO ITEM',
                fontSize: 24,
                fontWeight: FontWeight.bold),
            SizedBox(height: 10),
            CardProducaoItemList(
              store: store,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          push(
              context,
              ProducaoItemPage(
                storeProducaoItemList: store,
              ));
        },
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }
}
