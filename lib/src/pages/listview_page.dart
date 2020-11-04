import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  // Obj que permitira controlar el Scroll
  ScrollController _scrollControl = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregar5();

    // Esta atento al controlador
    _scrollControl.addListener(() {
      // print('Scrol');
      // Si llega al maximo del scroll agrega nuevas img
      if (_scrollControl.position.pixels ==
          _scrollControl.position.maxScrollExtent) {
        // _agregar5();
        _fethData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Detiene el controlador al cerrar la ventana
    _scrollControl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(children: [
          _crearLista(context),
          _crearLoading(),
        ]));
  }

  Widget _crearLista(BuildContext context) {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      // TODO ListView: Renderiza elementos conforme es necesario
      child: ListView.builder(
        controller: _scrollControl,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          // Guarda el valor de cada posicion
          final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300?random=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  void _agregar5() {
    for (var i = 1; i < 5; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  // Retorna nuevas imagenes despues de 2 seg
  Future _fethData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);

    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    // Permite mover el scroll un poco mas cuando se carge la data
    _scrollControl.animateTo(
      _scrollControl.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(microseconds: 250),
    );

    _agregar5();
  }

  Future<Null> obtenerPagina1() async {
    final duration = Duration(seconds: 2);

    new Timer(duration, () {
      // Borra el contenido de la lista
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar5();
    });

    return Future.delayed(duration);
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(height: 20.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
