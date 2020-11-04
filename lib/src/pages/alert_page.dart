import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alerts Page"),
      ),
      body: Center(
          child: RaisedButton(
              child: Text("Mostrar text"),
              color: Colors.teal,
              textTheme: ButtonTextTheme.primary,
              textColor: Colors.white,
              // Bordes redondeados
              shape: StadiumBorder(),
              onPressed: () => _mostrarAlerta(context))),
      // Boton para regresar
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      // Permite cerrar el dialog clickeando afuera
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Titulo Alert Dialog'),
          content: Column(
            // Se adapta al tamaño minimo del contenido interno
            mainAxisSize: MainAxisSize.min,
            children: [Text('Este es el contenido '), FlutterLogo(size: 100.0)],
          ),
          actions: [
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(context),
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {},
            )
          ],
        );
      },
    );
  }
}
