import 'package:bucks/src/shared/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/button.dart';
import '../movto_estoque_list_controller.dart';

class Buttons extends StatefulWidget {
  final dynamic store;
  final MovtoEstoqueListController storeMovtoEstoqueList;

  Buttons(
      {Key key,
      @required this.store,
      @required this.storeMovtoEstoqueList,
      BuildContext context})
      : super(key: key);

  @override
  _Buttons createState() => _Buttons();
}

class _Buttons extends State<Buttons> {
  dynamic get store => widget.store;
  MovtoEstoqueListController get storeMovtoEstoqueList =>
      widget.storeMovtoEstoqueList;

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
            ),
            margin: EdgeInsets.only(top: 20),
            child: Container(
              width: 100,
              child: AppButton(
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
    String msgErroDropDowns = await storeMovtoEstoqueList.validateDropDowns();

    /*if (msgErroDropDowns == '' && store.descricao.text == '') {
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
    }*/

    store.salvar(store: store, storeMovtoEstoqueList: storeMovtoEstoqueList);
    snackbarSucces(
        context: context,
        msg: "Movto Estoque inserido com sucesso !",
        title: "Movto Estoque Inserido");
  }
}
