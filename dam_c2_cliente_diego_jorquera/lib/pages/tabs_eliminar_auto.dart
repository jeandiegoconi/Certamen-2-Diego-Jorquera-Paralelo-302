import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
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
      appBar: AppBar(
        title: Text("Formulario"),
        elevation: 0,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10))),
              child: Text(
                "Formulario de matricula USM",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView(
                children: [
                  fieldText("Vni"),
                ],
              ),
            ))
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
        if (text == "Email" && !RegExp(regexEmail).hasMatch(nombres)) {
          return "Formato de Email no válido";
        }
        return null;
      },
      keyboardType:
          text == "Email" ? TextInputType.emailAddress : TextInputType.name,
    );
  }
}
