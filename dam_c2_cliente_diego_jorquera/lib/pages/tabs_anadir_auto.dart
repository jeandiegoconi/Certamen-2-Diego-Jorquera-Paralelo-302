import 'package:dam_c2_cliente_diego_jorquera/providers/autos_provider.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController vin = new TextEditingController();
  TextEditingController marca = new TextEditingController();
  TextEditingController modelo = new TextEditingController();
  TextEditingController ano = new TextEditingController();
  TextEditingController precio = new TextEditingController();
  String errVin = '';
  String errMarca = '';
  String errModelo = '';
  String errAno = '';
  String errPrecio = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Auto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: vin,
                decoration: InputDecoration(
                    labelText: 'Vin', hintText: 'Escriba el vin'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errVin,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              child: TextField(
                controller: marca,
                decoration: InputDecoration(
                    labelText: 'Marca', hintText: 'Escriba la marca'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errMarca,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              child: TextField(
                controller: modelo,
                decoration: InputDecoration(
                    labelText: 'Modelo', hintText: 'Escriba el modelo'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errModelo,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              child: TextField(
                controller: ano,
                decoration: InputDecoration(
                    labelText: 'Año', hintText: 'Escriba el Año del auto'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errAno,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              child: TextField(
                controller: precio,
                decoration: InputDecoration(
                    labelText: 'Precio',
                    hintText: 'Escriba el Precio del auto'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                errPrecio,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.all(10),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                child: Text('Agregar Auto'),
                onPressed: () => addAuto(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addAuto() async {
    AutoProvider provider = new AutoProvider();
    var data = await provider.addAuto(vin.value.text, marca.value.text,
        modelo.value.text, int.parse(ano.text), int.parse(precio.value.text));
  }
}
