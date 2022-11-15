import 'dart:convert';
import 'package:http/http.dart' as http;

//clase para realizar la conexión al API de monedas

class AutoProvider {
  final apiURL = 'http://10.0.2.2:8000/api/autos';

  Future<List<dynamic>> getAutos() async {
    var url = Uri.parse(apiURL);
    //la respuesta puede llegar en culaquier momento
    var respuesta = await http.get(url);

    //para inducir un poco de retardo
    //await Future.delayed(Duration(seconds: 3));

    // status code htpp 200 ok, / http 400 error del usuario /  htpp 500 error del server
    if (respuesta.statusCode == 200) {
      //los datos vienen en formato json por lo que se debe decodificar
      //los datos deben ser pasados a una lista y dinamica y
      //se recibirán en el futuro :  Future<List<dynamic>>
      return json.decode(respuesta.body);
    } else {
      return [];
    }

//método donde le paso el código de la moneda y me retorna el valor
//monedas por código

    Future<double> getAuto(String vinAuto) async {
      var url = Uri.parse(apiURL + '/' + vinAuto);
      var respuesta = await http.get(url);
      var auto = json.decode(respuesta.body);
      //la lista viene con comas, por lo tanto se usa replaceAll para cmabiar las comas por puntos
      return double.parse(auto['Valor'].replaceAll(',', '.'));
    }
  }
}
