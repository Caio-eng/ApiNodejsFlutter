import 'package:http/http.dart' as http;

const baseUrl = "http://10.0.2.2:3333";

class API {
  static Future getCarros() async {
    var url = baseUrl + "/carro";
    return await http.get(url);
  }
}