import 'package:bucks/src/pages/producao/widgets/card_producao.dart';
import 'package:bucks/src/shared/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../producao_page.dart';
import 'producao_list_controller.dart';

class ProducaoListPage extends StatefulWidget {
  final String title;
  const ProducaoListPage({Key key, this.title = "Consulta de Producao"})
      : super(key: key);

  @override
  _ProducaoListPageState createState() => _ProducaoListPageState();
}

class _ProducaoListPageState extends State<ProducaoListPage> {
  ProducaoListController store;

  @override
  void initState() {
    super.initState();
    store = ProducaoListController();
    store.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: <Widget>[
            CardProducaoList(store: store),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          push(
              context,
              ProducaoPage(
                storeProducaoList: store,
              ));
        },
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }
}
