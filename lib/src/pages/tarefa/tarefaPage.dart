import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class TarefaPage extends StatefulWidget {
  @override
  _TarefaPageState createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  final _toDoController = TextEditingController();
  
  List _toDoList = [];
  
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;

  @override
  void initState(){
    super.initState();

    _readData().then((data){
      setState(() {
        _toDoList = json.decode(data);
      });
    });
    
  }


  // List _toDoList = ["Alexandre", "Janaína", "Whiskie", "Charlie", "Jully"];
  
  void _addToDo(){
    // consigo acessar os controladores
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["title"] = _toDoController.text;
      _toDoController.text = "";
      newToDo["ok"] = false;
      _toDoList.add(newToDo);

      _saveData();
    });
  }
    
  Future<File> _getFile() async {
    // pega o diretorio do meu S.O. 
    final directory = await getApplicationDocumentsDirectory();
    print('diretorio: $directory');
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Terefas"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _toDoController,
                    decoration: InputDecoration(
                      labelText: "Nova Tarefa",
                      labelStyle: TextStyle(color: Colors.blueAccent )
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text("ADD"),
                  textColor: Colors.white,
                  onPressed: _addToDo,
                )
            ],
            ),
          ),
          Expanded(
            // .build => construtor vai permitir que seja construido conforme vai passando pela lista
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0),
              // qtd de registros na lista
              itemCount: _toDoList.length,
              // funcao anonima que recebe context e index
              // index = o elementro da lista que esta desenhando no momento
              itemBuilder: buildItem),

          )
        ],
      ),
    );
  }

  Widget buildItem (BuildContext context, int index){
    return Dismissible(
      // key = identificador de cada linha
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_toDoList[index]["title"]),
        value: _toDoList[index]["ok"], 
        secondary: CircleAvatar(
          child: Icon(_toDoList[index]["ok"] ? Icons.check : Icons.error),
        ),
        // é executado qdo alterado o ChackBox
        onChanged: (check){
          setState(() {
            _toDoList[index]["ok"] = check;
            _saveData();
          });
        },
        ),
        // function que sera executada ao arrastar 
        onDismissed: (direction){
          setState(() {
            _lastRemoved = Map.from(_toDoList[index]);
            _lastRemovedPos = index;
            _toDoList.removeAt(index);

            _saveData();

            final snack = SnackBar(
              content: Text("Tarefa \"${_lastRemoved["title"]}\" removida!"),
              action: SnackBarAction(
                label: "Desfazer",
                onPressed: (){
                  setState(() {
                    _toDoList.insert(_lastRemovedPos, _lastRemoved);
                    _saveData();                    
                  });
                },
              ),
              duration: Duration(seconds: 2),
          
            );
          
            Scaffold.of(context).showSnackBar(snack);

          });
        }
    );

  }

}