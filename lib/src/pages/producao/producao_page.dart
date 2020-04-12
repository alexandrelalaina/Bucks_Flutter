import 'package:bucks/src/pages/producao/producao_controller.dart';
import 'package:bucks/src/pages/producao/producao_list/producao_list_controller.dart';
import 'package:bucks/src/pages/producao/widgets/card_producao.dart';
import 'package:flutter/material.dart';


class ProducaoPage extends StatefulWidget {
  final String title;
  final ProducaoListController storeProducaoList;
  const ProducaoPage(
      {Key key,
      this.title = "Cadastro de Producao",
      @required this.storeProducaoList})
      : super(key: key);

  @override
  _ProducaoPageState createState() => _ProducaoPageState();
}

class _ProducaoPageState extends State<ProducaoPage> {
  ProducaoController store;
  ProducaoListController get storeProducaoList => widget.storeProducaoList;

  @override
  void initState() {
    super.initState();
    store = ProducaoController();
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
              CardProducao(
                store: store,
                storeProducaoList: storeProducaoList,
              ),
            ],
          ),
        ));
  }
}
