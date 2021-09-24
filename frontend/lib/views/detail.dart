import 'package:flutter/material.dart';
import 'package:frontend/controllers/api.dart';
import 'package:frontend/main.dart';
import 'package:frontend/models/carro.dart';
import 'package:frontend/views/editPage.dart';

import 'addcarpage.dart';

class Detail extends StatefulWidget {
  final List<Carro> list;
  final int index;

  const Detail({required this.list, required this.index});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  API api = new API();

  _navigateAddCarro(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage()
        ));
    if (result) {
      setState(() {

      });
    }
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Quer deletar o registro '${widget.list[widget.index].id}'"),
      actions: [
        new RaisedButton(
          child: new Text(
              "Remover!",
            style: TextStyle(color: Colors.red),
          ),
            onPressed: () {
              api.removeCarro(widget.list[widget.index].id.toString());
              _navigateAddCarro(context);
            }
        ),
        new RaisedButton(
            child: new Text(
              "Cancelar",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(context: (context), builder: (dynamic) {
      return alertDialog;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Escolha'),
        backgroundColor: Colors.indigo[700],
      ),
      body: Center(
        child: Container(
          height: 270,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Center(
              child: Column(
                children: [
                  new Padding(
                      padding: EdgeInsets.only(top: 30)
                  ),
                  new Text(
                    "Automovel: " + widget.list[widget.index].nome,
                    style: TextStyle(fontSize: 20),
                  ),
                  Divider(),
                  new Padding(
                      padding: EdgeInsets.only(top: 30)
                  ),
                  new Text(
                    "Marca: " + widget.list[widget.index].marca,
                    style: TextStyle(fontSize: 20),
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                          child: Text('Editar'),
                          color: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                          ),
                          onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                              builder: (context) => EditCarPage(
                                  list: widget.list,
                                  index: widget.index
                              )
                          ))
                      ),
                      VerticalDivider(),
                      RaisedButton(
                          child: Text('Deletar'),
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          onPressed: () => confirm(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
