import 'package:bucks/src/pages/item/item_controller.dart';
import 'package:bucks/src/pages/item/item_list/item_list_controller.dart';
import 'package:bucks/src/shared/widgets/button.dart';
import 'package:bucks/src/shared/widgets/flat_button_app.dart';
import 'package:bucks/src/shared/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Buttons extends StatefulWidget {
  final dynamic store;
  final ItemListController storeItemList;

  Buttons(
      {Key key,
      @required this.store,
      @required this.storeItemList,
      BuildContext context})
      : super(key: key);

  @override
  _Buttons createState() => _Buttons();
}

class _Buttons extends State<Buttons> {
  dynamic get store => widget.store;
  ItemListController get storeItemList => widget.storeItemList;

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[      
        Expanded(
        child:
        Container(                 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
          ),
          margin: EdgeInsets.only(top: 20),
          child: Container(
            width: 100,
            child:           
             AppButton(
              "Salvar",
              onPressedButtons,
            ),
          ),
        ),
        ),
      ],
    );
  }

   onPressedButtons() async {
    
     String msgErroDropDowns = await storeItemList.validateDropDowns();

     if (msgErroDropDowns != '' && store.descricao.text != '') {
       snackbarError(context: context, msg: "Existem campos que não estão preenchidos !");
      return;
     }
  
    if (store.cdControlaEstoque.text == null ||
        (store.cdControlaEstoque.text != 'L' &&
        store.cdControlaEstoque.text != 'S' &&
        store.cdControlaEstoque.text != 'N' &&
        store.cdControlaEstoque.text != 'l' &&
        store.cdControlaEstoque.text != 's' &&
        store.cdControlaEstoque.text != 'n'      
        )) {
      snackbarError(context: context, msg: "Código do estoque inválido !");
      return;
    }

    store.salvarItem(store: store, storeItemList: storeItemList);
    snackbarSucces(context: context, msg: "Item inserido com sucesso !", title: "Item Inserido");

  }
}
