// Utilidad para usarla en cualquier parte

import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'tune': Icons.tune,
  'list': Icons.list,
};

// Crea un metodo para poder crear un icono segun el string
Icon getIcon(String icono) {
  return Icon(
    _icons[icono],
    color: Colors.blue,
  );
}
