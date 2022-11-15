import 'package:flutter/material.dart';
import 'package:dam_c2_cliente_diego_jorquera/pages/tabs_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabsPage(),
    );
  }
}
