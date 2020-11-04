import 'package:flutter/material.dart';

class HomeTempPage extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuarto', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes Temp')),
      body: ListView(
        //children: _crearItems(),
        children: _crearItemsCorto(),
      ),
    );
  }

// Crea un lista de Widgets
  List<Widget> _crearItems() {
    // Lista dinamica
    List<Widget> lista = List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      // Operador cascada
      lista..add(tempWidget)..add(Divider());
      //lista.add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorto() {
    var widgets = opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Subtitulo'),
            // Icono izquierdo
            leading: Icon(Icons.accessibility_new),
            // Icono derecho
            trailing: Icon(Icons.arrow_forward_ios),
            // Presionar
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();

    return widgets;
  }
}
