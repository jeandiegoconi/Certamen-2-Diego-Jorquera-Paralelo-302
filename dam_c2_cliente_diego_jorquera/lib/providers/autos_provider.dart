import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:collection';

//clase para realizar la conexión al API de monedas

class AutoProvider {
  final apiURL = 'http://10.0.2.2:8000/api/autos';

  Future<List<dynamic>> getAutos() async {
    var url = Uri.parse(apiURL);

    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>?> addAuto(
      String vin, String marca, String modelo, int ano, int precio) async {
    var url = Uri.parse(apiURL);
    var respuesta = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'vin': vin,
          'marca': marca,
          'modelo': modelo,
          'año': ano,
          'precio': precio
        }));
    if (respuesta.body.isNotEmpty) {
      return jsonDecode(respuesta.body);
    } else {
      return null;
    }
  }

  Future<http.Response> borrarAuto(String vin) async {
    var url = Uri.parse(apiURL);
    return await http.delete(url);
  }
}
