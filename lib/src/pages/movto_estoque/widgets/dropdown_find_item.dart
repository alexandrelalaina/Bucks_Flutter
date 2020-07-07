import 'package:bucks/src/classes/item.dart';
import 'package:bucks/src/shared/utils/formatar_id_descr.dart';
import 'package:bucks/src/shared/widgets/text_message.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../movto_estoque_list_controller.dart';

//-----------------------------------------------------------------------
class DropdownFindItem extends StatefulWidget {
  final dynamic store;

  const DropdownFindItem({Key key, @required this.store}) : super(key: key);

  @override
  _DropdownFindItemState createState() => _DropdownFindItemState();
}

class _DropdownFindItemState extends State<DropdownFindItem> {
  MovtoEstoqueListController get store => widget.store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        if (!store.hasResults) {
          return Container();
        }

        if (store.lovItens.isEmpty) {
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
        if (store.lovItemSelected != null) {
          itemSelect = store.lovItemSelected;
        }

        return FindDropdown<Item>(
          selectedItem: itemSelect,
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
                        formatarIdDescr(item.id.toString(), item.descr),
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
                      formatarIdDescr(item.id.toString(), item.descr),
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

        // return Container(
        //   child: Text('testando1'),
        // );
      },
    );
  }
}
