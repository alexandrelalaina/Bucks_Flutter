import 'package:bucks/src/pages/movto_estoque/widgets/card_movto_estoque.dart';
import 'package:flutter/material.dart';

import 'movto_estoque_list_controller.dart';

class MovtoEstoqueListPage extends StatefulWidget {
  final String title;
  const MovtoEstoqueListPage({Key key, this.title = "Consulta Movto Estoque"})
      : super(key: key);

  @override
  _MovtoEstoqueListPageState createState() => _MovtoEstoqueListPageState();
  
}

class _MovtoEstoqueListPageState extends State<MovtoEstoqueListPage> {
  MovtoEstoqueListController store;

  @override
  void initState() {
    super.initState();
    store = MovtoEstoqueListController();
    store.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            CardMovtoEstoqueList(store: store),
          ],
        ),
      ),
    );
  }
}