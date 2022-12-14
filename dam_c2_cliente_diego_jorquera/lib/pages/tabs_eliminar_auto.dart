import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:dam_c2_cliente_diego_jorquera/providers/autos_provider.dart';

class EliminarAuto extends StatefulWidget {
  EliminarAuto({Key? key}) : super(key: key);

  @override
  State<EliminarAuto> createState() => _EliminarAutoState();
}

class _EliminarAutoState extends State<EliminarAuto> {
  final formKey = GlobalKey<FormState>();
  AutoProvider provider = new AutoProvider();
  TextEditingController vin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView(
                children: [
                  TextFormField(
                    controller: vin,
                    decoration: InputDecoration(
                        labelText: 'Vin', hintText: 'Escriba el Vin del auto'),
                  ),
                ],
              ),
            )),
            Spacer(),
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.all(10),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                child: Text('Eliminar Auto'),
                onPressed: () => {
                  provider.borrarAuto(vin.text.toString().trim()),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
