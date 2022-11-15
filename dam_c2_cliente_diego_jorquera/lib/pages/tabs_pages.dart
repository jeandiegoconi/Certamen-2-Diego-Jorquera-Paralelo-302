import 'package:flutter/material.dart';
import 'package:dam_c2_cliente_diego_jorquera/pages/tabs_autos_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabsPage extends StatelessWidget {
  // const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DAM C2 Diego Jorquera'),
          leading: Icon(MdiIcons.carConnected),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Lista de Autos'),
            ],
          ),
        ),
        body: TabBarView(children: [
          TabsAutosPage(),
          // TabsCalculadoraPage(),
        ]),
      ),
    );
  }
}
