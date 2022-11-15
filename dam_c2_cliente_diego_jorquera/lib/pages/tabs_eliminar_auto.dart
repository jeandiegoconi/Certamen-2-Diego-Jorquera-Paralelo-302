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
  final regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  DateTime fechaSeleccionada = DateTime.now();
  var fFecha = DateFormat("dd-MM-yyyy");
  String jornadaSeleccionada = "d";
  bool gratuidad = false;

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
                  fieldText("Vni"),
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
                onPressed: () => EliminarAuto(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField fieldText(String text) {
    return TextFormField(
      decoration: InputDecoration(labelText: text + ": "),
      validator: (nombres) {
        if (nombres!.isEmpty) {
          return "Ingrese " + text;
        }
        return null;
      },
      keyboardType:
          text == "Email" ? TextInputType.emailAddress : TextInputType.name,
    );
  }
}
