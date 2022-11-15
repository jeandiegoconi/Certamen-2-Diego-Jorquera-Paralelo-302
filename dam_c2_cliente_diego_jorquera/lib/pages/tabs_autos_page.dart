import 'package:flutter/material.dart';
import 'package:dam_c2_cliente_diego_jorquera/providers/autos_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabsAutosPage extends StatefulWidget {
  // const TabsMonedasPage({super.key});

  @override
  State<TabsAutosPage> createState() => _TabsAutosPageState();
}

class _TabsAutosPageState extends State<TabsAutosPage> {
  AutoProvider autos = AutoProvider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder<dynamic>(
              future: autos.getAutos(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: Container(
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Cargando...'),
                              CircularProgressIndicator(),
                            ],
                          )));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: Icon(MdiIcons.car),
                          title: Text(snapshot.data[index]['marca']),
                          subtitle: Text(snapshot.data[index]['modelo'] +
                              " Año " +
                              '${snapshot.data[index]['año']}'),
                          trailing:
                              Text('${snapshot.data[index]['precio']} CLP'));
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
