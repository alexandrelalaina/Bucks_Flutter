import 'package:bucks/src/classes/item.dart';
import 'package:bucks/src/classes/item_estoque.dart';
import 'package:bucks/src/pages/producao/producao_controller.dart';
import 'package:bucks/src/pages/producao/producao_list/producao_list_controller.dart';
import 'package:bucks/src/pages/producao_item/producao_item_list/producao_item_list_controller.dart';
import 'package:bucks/src/shared/widgets/snackbar_custom.dart';
import 'package:bucks/src/shared/widgets/text_message.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DropdownFindItemEstoque extends StatefulWidget {
  final ProducaoListController store;
  final ProducaoController store2;

  const DropdownFindItemEstoque(
      {Key key, @required this.store, @required this.store2})
      : super(key: key);

  @override
  _DropdownFindProducaoState createState() => _DropdownFindProducaoState();
}

class _DropdownFindProducaoState extends State<DropdownFindItemEstoque> {
  ProducaoListController get store => widget.store;
  ProducaoController get store2 => widget.store2;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        if (!store.hasResultsItemEstoque) {
          //if (1 == 2) {
          return Container();
        }

        if (store.itemsEstoque.isEmpty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextMessage(
                'Nenhuma Item Estoque. \nClique aqui para tentar novamente.',
                fontSize: 18,
                // onRefresh: store.fetchUnidade,
              ),
            ],
          );
        }
        ItemEstoque itemSelect;
        if (store.itemEstoque != null) {
          itemSelect = store.itemEstoque;
        }
        return FindDropdown<ItemEstoque>(
          selectedItem:
              itemSelect, //store.items.isNotEmpty ? store.items.first : null,
          onFind: (String filter) async {
            return await store.filteredListItemEstoque(filter);
          },
          onChanged: (ItemEstoque data) async {
            await store.setLixo();
            bool jaPossuiItem = store.validaDataTablePossuiItem(data.descrItem);

            if (jaPossuiItem) {
              snackbarInfoWithoutDuration(
                  context: context,
                  msg: "O item escolhido já está inserido na tabela !");

              return;
            } else {
              await store.setProducao(data, store2.descr.text);
            }

            print(data.descrItem);
          },
          dropdownBuilder: (BuildContext context, ItemEstoque item) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: (item == null)
                  ? ListTile(
                      title: Text(
                        "Escolha o item para produção",
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                  : ListTile(
                      title: Text(
                        '${item.fkItemId.toString()} - ${item.descrItem}',
                        style: TextStyle(fontSize: 24),
                      ),
                      // subtitle: Text(item.empresaDescr),
                    ),
            );
          },
          dropdownItemBuilder:
              (BuildContext context, ItemEstoque item, bool isSelected) {
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
                      '${item.fkItemId.toString()} - ${item.descrItem}',
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
            print(data.descr);
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
                        '${item.id.toString()} - ${item.descr}',
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
