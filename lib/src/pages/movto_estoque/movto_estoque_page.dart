import 'package:bucks/src/pages/movto_estoque/movto_estoque_controller.dart';
// import 'package:bucks/src/shared/utils/datatime.dart';
import 'package:flutter/material.dart';

import 'movto_estoque_list_controller.dart';
import 'widgets/card_movto_estoque.dart';

class MovtoEstoquePage extends StatefulWidget {
  final String title;
  final MovtoEstoqueListController storeMovtoEstoqueList;
  const MovtoEstoquePage(
      {Key key,
      this.title = "Cadastro Movto Estoque",
      @required this.storeMovtoEstoqueList})
      : super(key: key);

  @override
  _MovtoEstoquePageState createState() => _MovtoEstoquePageState();
}

class _MovtoEstoquePageState extends State<MovtoEstoquePage> {
  MovtoEstoqueController store;
  MovtoEstoqueListController get storeMovtoEstoqueList =>
      widget.storeMovtoEstoqueList;

  @override
  void initState() {
    super.initState();
    store = MovtoEstoqueController();
    // var x = hoje;
    // print('hoje:$x');
    // store.dt.text = x;
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
              CardMovtoEstoque(
                store: store,
                storeMovtoEstoqueList: storeMovtoEstoqueList,
              ),
              //Buttons(store: store, storeItemList: storeItemList,),
            ],
          ),
        ));
  }
}
