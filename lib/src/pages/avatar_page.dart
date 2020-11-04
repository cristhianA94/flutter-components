import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: [
          Container(
            margin: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.thesixthaxis.com/wp-content/uploads/2013/03/gowint200.jpg'),
              radius: 22.0,
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                  child: Text('SL'), backgroundColor: Colors.brown))
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcScOjzAkAakfFM8kJppMfFIw0rTwJV9JpSANw&usqp=CAU'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
      // Boton para regresar
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
