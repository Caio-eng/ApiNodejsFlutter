import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl = "http://10.0.2.2:3333";

class API {
  static Future getCarros() async {
    var url = baseUrl + "/carro";
    return await http.get(url);
  }
  Future<http.Response> addCarro(String nome, String marca, String modelo) async {
      var url = baseUrl + "/carro";
      Map data = {
        'nome': '$nome',
        'marca': '${marca}',
        "modelo": '${modelo}'
      };

      var body = json.encode(data);

      var response = await http.post(url, headers: {"content-Type": "application/json"}, body: body);
      return response;
  }
}