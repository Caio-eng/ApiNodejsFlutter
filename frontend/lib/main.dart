import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api.dart';
import 'carro.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var carros = <Carro>[];

  _getCarros() {
    API.getCarros().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        carros = lista.map((model) => Carro.fromJson(model)).toList();
      });
    });
  }

  _HomePageState() {
    _getCarros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars List'),
        backgroundColor: Colors.indigo[900],
      ),
      body: listaCarros(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add, size: 30,),
      ),
    );
  }

  listaCarros() {
    return ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.directions_car, size: 30, color: Colors.indigo,),
              title: Text(
                "\nAutomovel: " + carros[index].nome,
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "\nMarca: ${carros[index].marca}",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          );
        }
    );
  }
}
