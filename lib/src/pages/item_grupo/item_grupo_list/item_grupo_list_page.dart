import 'package:bucks/src/pages/item_grupo/item_grupo_list/item_grupo_list_controller.dart';
import 'package:bucks/src/pages/item_grupo/item_grupo_page.dart';
import 'package:bucks/src/pages/item_grupo/widgets/card_item_grupo.dart';
import 'package:bucks/src/shared/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemGrupoListPage extends StatefulWidget {
  final String title;
  const ItemGrupoListPage({Key key, this.title = "Consulta Item Grupo"})
      : super(key: key);

  @override
  _ItemGrupoListPageState createState() => _ItemGrupoListPageState();
}

class _ItemGrupoListPageState extends State<ItemGrupoListPage> {
  ItemGrupoListController store;

  @override
  void initState() {
    super.initState();
    store = ItemGrupoListController();
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
            CardItemGrupoList(store: store),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          push(
              context,
              ItemGrupoPage(
                storeItemGrupoList: store,
              ));
        },
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }
}
