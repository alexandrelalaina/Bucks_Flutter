import 'package:bucks/src/classes/producao.dart';
import 'package:bucks/src/pages/producao/producao_controller.dart';
import 'package:bucks/src/pages/producao/producao_item_page.dart';
import 'package:bucks/src/pages/producao/producao_list/producao_list_controller.dart';
import 'package:bucks/src/pages/producao/widgets/card_producao.dart';
import 'package:bucks/src/pages/producao/widgets/producaoItemDt.dart';
import 'package:bucks/src/shared/utils/colors.dart';
import 'package:bucks/src/shared/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProducaoPage extends StatefulWidget {
  final String title;
  final ProducaoListController storeProducaoList;
  final Producao producao;
  const ProducaoPage(
      {Key key,
      this.title = "Cadastro de Producao / Item",
      @required this.storeProducaoList,
      @required this.producao})
      : super(key: key);

  @override
  _ProducaoPageState createState() => _ProducaoPageState();
}

class _ProducaoPageState extends State<ProducaoPage> {
  ProducaoController store;
  ProducaoListController get storeProducaoList => widget.storeProducaoList;

  Producao get producao => widget.producao;

  @override
  void initState() {
    //print(producao.descr != null ? producao.descr.toString() : "");

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
              // parte da produção
              CardProducao(
                store: store,
                storeProducaoList: storeProducaoList,
                producao: producao,
              ),
              // parte da produção item
              CorDeFundo.ContainerDecorationPadrao(
                  text: 'Itens da Produção',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 10),
              ProducaoItensDt(
                store: storeProducaoList,
              ),
              FloatingActionButton(
                backgroundColor: Colors.blueAccent,
                onPressed: () {
                  push(
                      context,
                      ProducaoItemPage(
                        storeProducaoList: storeProducaoList,
                      ));
                },
                child: Icon(FontAwesomeIcons.plus),
              ),
              SizedBox(height: 10),
              // Scaffold(
              //   floatingActionButton: FloatingActionButton(
              //     onPressed: () {
              //       // push(
              //       //     context,
              //       //     ProducaoPage(
              //       //       storeProducaoList: store,
              //       //     ));
              //     },
              //     child: Icon(FontAwesomeIcons.plus),
              //   ),
              // ),

              // parte de produção item
              // CorDeFundo.ContainerDecorationPadrao(
              //     text: 'Item Produção',
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold),
              // SizedBox(height: 10),
              // DropdownFindItemEstoque(
              //   store: storeProducaoList,
              //   store2: store,
              // ),
              // ProducaoItensDtNovo(
              //     store: store, storeProducaoListController: storeProducaoList),
              // CardButton(store: store),
            ],
          ),
        ));
  }
}
