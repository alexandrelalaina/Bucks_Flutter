import 'package:bucks/src/pages/producao/producao_controller.dart';
import 'package:bucks/src/pages/producao/producao_list/producao_list_controller.dart';
import 'package:bucks/src/pages/producao/widgets/card_producao_item.dart';
import 'package:bucks/src/pages/producao/widgets/dropdown_find.dart';
import 'package:bucks/src/pages/producao/widgets/producaoItemDtNovo.dart';
import 'package:bucks/src/shared/utils/colors.dart';
import 'package:flutter/material.dart';

class ProducaoItemPage extends StatefulWidget {
  final String title;
  final ProducaoListController storeProducaoList;
  const ProducaoItemPage(
      {Key key,
      this.title = "Cadastro de Producao Item",
      @required this.storeProducaoList})
      : super(key: key);

  @override
  _ProducaoItemPageState createState() => _ProducaoItemPageState();
}

class _ProducaoItemPageState extends State<ProducaoItemPage> {
  ProducaoController store;
  ProducaoListController get storeProducaoList => widget.storeProducaoList;

  @override
  void initState() {
    super.initState();
    store = ProducaoController();
    storeProducaoList.producaoItensDt.clear();
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
              // parte de produção item
              SizedBox(height: 10),
              CorDeFundo.ContainerDecorationPadrao(
                  text: 'Item Produção',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 10),
              DropdownFindItemEstoque(
                store: storeProducaoList,
                store2: store,
              ),
              ProducaoItensDtNovo(
                  store: store, storeProducaoListController: storeProducaoList),
              CardButton(store: store),
            ],
          ),
        ));
  }
}
