import 'package:bucks/src/classes/item.dart';
import 'package:bucks/src/classes/producao.dart';
import 'package:bucks/src/pages/producao_item/producao_item_list/producao_item_list_controller.dart';
import 'package:bucks/src/shared/widgets/text_message.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DropdownFindProducao extends StatefulWidget {
  final dynamic store;

  const DropdownFindProducao({Key key, @required this.store}) : super(key: key);

  @override
  _DropdownFindProducaoState createState() => _DropdownFindProducaoState();
}

class _DropdownFindProducaoState extends State<DropdownFindProducao> {
  ProducaoItemListController get store => widget.store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        if (!store.hasResultsProducao) {
          //if (1 == 2) {
          return Container();
        }

        if (store.producoes.isEmpty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextMessage(
                'Nenhuma produção encontrado. \nClique aqui para tentar novamente.',
                fontSize: 18,
                // onRefresh: store.fetchUnidade,
              ),
            ],
          );
        }
        Producao itemSelect;
        if (store.producao != null) {
          itemSelect = store.producao;
        }
        return FindDropdown<Producao>(
          selectedItem:
              itemSelect, //store.items.isNotEmpty ? store.items.first : null,
          onFind: (String filter) async {
            return await store.filteredListProducao(filter);
          },
          onChanged: (Producao data) async {
            await store.setProducao(data);
            print(data.descr);
          },
          dropdownBuilder: (BuildContext context, Producao item) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: (item == null)
                  ? ListTile(
                      title: Text(
                        "Nenhuma produção selecionada",
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                  : ListTile(
                      title: Text(
                        '${item.id.toString()} - ${item.descr}',
                        style: TextStyle(fontSize: 24),
                      ),
                      // subtitle: Text(item.empresaDescr),
                    ),
            );
          },
          dropdownItemBuilder:
              (BuildContext context, Producao item, bool isSelected) {
            return Container(
              decoration: !isSelected
                  ? null
                  : BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    selected: isSelected,
                    title: Text(
                      '${item.id.toString()} - ${item.descr}',
                      style: TextStyle(fontSize: 24),
                    ),
                    // subtitle: Text(item.empresaDescr),
                  ),
                  Divider()
                ],
              ),
            );
          },
        );
      },
    );
  }
}

//-----------------------------------------------------------------------
class DropdownFindItem extends StatefulWidget {
  final dynamic store;

  const DropdownFindItem({Key key, @required this.store}) : super(key: key);

  @override
  _DropdownFindItemState createState() => _DropdownFindItemState();
}

class _DropdownFindItemState extends State<DropdownFindItem> {
  ProducaoItemListController get store => widget.store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        if (!store.hasResultsItem) {
          //if (1 == 2) {
          return Container();
        }

        if (store.itens.isEmpty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextMessage(
                'Nenhum item grupo encontrado. \nClique aqui para tentar novamente.',
                fontSize: 18,
                // onRefresh: store.fetchUnidade,
              ),
            ],
          );
        }
        Item itemSelect;
        if (store.item != null) {
          itemSelect = store.item;
        }
        return FindDropdown<Item>(
          selectedItem:
              itemSelect, //store.items.isNotEmpty ? store.items.first : null,
          onFind: (String filter) async {
            return await store.filteredListItens(filter);
          },
          onChanged: (Item data) async {
            await store.setItem(data);
            print(data.descricao);
          },
          dropdownBuilder: (BuildContext context, Item item) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: (item == null)
                  ? ListTile(
                      title: Text(
                        "Nenhum item selecionado",
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                  : ListTile(
                      title: Text(
                        '${item.id.toString()} - ${item.descricao}',
                        style: TextStyle(fontSize: 24),
                      ),
                      // subtitle: Text(item.empresaDescr),
                    ),
            );
          },
          dropdownItemBuilder:
              (BuildContext context, Item item, bool isSelected) {
            return Container(
              decoration: !isSelected
                  ? null
                  : BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    selected: isSelected,
                    title: Text(
                      '${item.id.toString()} - ${item.descricao}',
                      style: TextStyle(fontSize: 24),
                    ),
                    // subtitle: Text(item.empresaDescr),
                  ),
                  Divider()
                ],
              ),
            );
          },
        );
      },
    );
  }
}
