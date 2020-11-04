import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
// Util
import 'package:componentes/src/utils/icono_string_util.dart';
// Routes
import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes')),
      body: _lista(),
    );
  }

  // Crea el body del Scaffold
  Widget _lista() {
    // print(menuProvider.opciones);
    // Forma no optima
    //menuProvider.cargarData().then((opciones) => print(opciones));

    // FutureBuilder permite construir widgets asincronos
    return FutureBuilder(
      future: menuProvider.cargarData(),
      // TODO Inicializa la data antes de cargar
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        // print(snapshot.data);
        return ListView(
          children: _crearListaItems(snapshot.data, context),
        );
      },
    );
  }

  // Crea la lista a partir del JSON
  List<Widget> _crearListaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.amber),
        onTap: () {
          // Navegar por rutas
          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
