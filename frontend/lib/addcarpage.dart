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
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(
            top: 52, left: 12, right: 12, bottom: 12
          ),
          children: [
            Container(
              height: 50,
              child: TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: 'nome',
                  hintText: 'Nome do Carro',
                  icon: Icon(Icons.directions_car),
                ),
              ),
            ),
            Container(
              height: 50,
              child: TextField(
                controller: marcaController,
                decoration: InputDecoration(
                  labelText: 'marca',
                  hintText: 'Marca do Carro',
                  icon: Icon(Icons.perm_device_information),
                ),
              ),
            ),
            Container(
              height: 50,
              child: TextField(
                controller: modeloController,
                decoration: InputDecoration(
                  labelText: 'modelo',
                  hintText: 'Modelo do Carro',
                  icon: Icon(Icons.perm_device_information),
                ),
              ),
            ),
            Padding(
                padding: new EdgeInsets.only(top: 44),
            ),
            Container(
              height: 50,
              child: RaisedButton(
                onPressed: (){
                  api.addCarro(
                    nomeController.text.trim(),
                    marcaController.text.trim(),
                    modeloController.text.trim(),
                  );
                  Navigator.pop(context, true);
                },
                color: Colors.blue,
                child: Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
