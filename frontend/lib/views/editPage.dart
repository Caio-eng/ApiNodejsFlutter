import 'package:flutter/material.dart';
import 'package:frontend/controllers/api.dart';
import 'package:frontend/main.dart';
import 'package:frontend/models/carro.dart';

import 'addcarpage.dart';

class EditCarPage extends StatefulWidget {
  final List<Carro> list;
  final int index;

  EditCarPage({required this.list, required this.index});

  @override
  _EditCarPageState createState() => _EditCarPageState();
}

class _EditCarPageState extends State<EditCarPage> {

  API api = new API();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nomeController;
  late TextEditingController marcaController;
  late TextEditingController modeloController;
  late TextEditingController idController;
  String _mensagemErro = "";

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

  @override
  void initState() {
    idController = new TextEditingController(
      text: widget.list[widget.index].id.toString()
    );
    nomeController = new TextEditingController(
        text: widget.list[widget.index].nome.toString()
    );
    marcaController = new TextEditingController(
        text: widget.list[widget.index].marca.toString()
    );
    modeloController = new TextEditingController(
        text: widget.list[widget.index].modelo.toString()
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cadastrar Carro'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: TextFormField(
                      controller: idController,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                        labelText: 'id',
                        hintText: 'ID do Carro',
                        //icon: Icon(Icons.directions_car),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: TextFormField(
                      controller: nomeController,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                        labelText: 'nome',
                        hintText: 'Nome do Carro',
                        //icon: Icon(Icons.directions_car),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: TextFormField(
                      controller: marcaController,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                        labelText: 'marca',
                        hintText: 'Marca do Carro',
                        //icon: Icon(Icons.directions_car),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: TextFormField(
                      controller: modeloController,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                        labelText: 'modelo',
                        hintText: 'Modelo do Carro',
                        //icon: Icon(Icons.directions_car),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: RaisedButton(
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.indigo[900],
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        api.editCarro(
                            idController.text.trim(),
                            nomeController.text.trim(),
                            marcaController.text.trim(),
                            modeloController.text.trim()
                        );
                        _navigateAddCarro(context);
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      _mensagemErro,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
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