// Permite leer data de assets
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    //cargarData();
  }

  // Retorna una tarea que se va a resolver en un futuro
  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    // Convierte el Json en un Map
    Map dataMap = json.decode(resp);
    // print(dataMap['rutas']);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

// Se la instancia porque solo se la va a utilizar una vez
final menuProvider = _MenuProvider();
