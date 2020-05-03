import 'package:bucks/src/pages/movto_estoque/movto_estoque_page.dart';
import 'package:bucks/src/pages/movto_estoque/widgets/card_movto_estoque.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/utils/nav.dart';
import 'movto_estoque_list_controller.dart';

class MovtoEstoqueListPage extends StatefulWidget {
  final String title;
  const MovtoEstoqueListPage({Key key, this.title = "Consulta Movto Estoque"})
      : super(key: key);

  @override
  _MovtoEstoqueListPageState createState() => _MovtoEstoqueListPageState();
}

class _MovtoEstoqueListPageState extends State<MovtoEstoqueListPage> {
  MovtoEstoqueListController storeList;

  @override
  void initState() {
    super.initState();
    storeList = MovtoEstoqueListController();
    storeList.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            CardMovtoEstoqueList(store: storeList),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          push(
              context,
              MovtoEstoquePage(
                storeMovtoEstoqueList: storeList,
              ));
        },
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }
}
