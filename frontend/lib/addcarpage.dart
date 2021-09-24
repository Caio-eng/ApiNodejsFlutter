import 'package:flutter/material.dart';
import 'package:frontend/api.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({Key? key}) : super(key: key);

  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {

  API api = API();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController marcaController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cadastrar Carro'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Form(
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
                    child: TextField(
                      controller: nomeController,
                      autofocus: true,
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
                    child: TextField(
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
                    child: TextField(
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
                        api.addCarro(
                          nomeController.text.trim(),
                          marcaController.text.trim(),
                          modeloController.text.trim(),
                        );
                        Navigator.pop(context, true);
                      },
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
