import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        // TODO Padding ListView
        // padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      // TODO z-indez de cards
      elevation: 10.0,
      // Bordes cards
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Titulo de tarjeta'),
            subtitle: Text(
                'Subtitulo de esta tarjeta, esto es un texto de prueba para las cards para comprobar el texto aqui mostrado'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(child: Text('Cancelar'), onPressed: () {}),
              FlatButton(child: Text('Ok'), onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://www.photographytalk.com/images/articles/2017/04/28/iStock-546424192.jpg'),
            // Carga una imagen de assets mientras carga
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 250),
            height: 300.0,
            // Permite que no se mueva la imagen al aparecer
            fit: BoxFit.fill,
          ),
          Container(padding: EdgeInsets.all(10.0), child: Text('Hola'))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          // Estilo color bordes
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                // Eje cartesiano invertido: X+ son desde la derecha, Y+ son arriba
                offset: Offset(2.0, 10.0))
          ]
          //color: Colors.red
          ),
      // Arregla los bordes que exceden del container
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
