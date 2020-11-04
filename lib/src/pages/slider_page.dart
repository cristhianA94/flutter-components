import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 0.0;
  bool _bloquearChek = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckbox(),
            _crearSwith(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      value: _valorSlider,
      min: 0.0,
      max: 400.0,
      activeColor: Colors.teal,
      label: 'Tamaño de la imagen',
      //divisions: 10,
      onChanged: (_bloquearChek)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://aws.glamour.mx/prod/designs/v1/assets/1170x614/221544.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckbox() {
    /* return Checkbox(
                  value: _bloquearChek,
                  onChanged: (valor) {
                    setState(() {
                      _bloquearChek = valor;
                    });
                  },
                ); */
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearChek,
      onChanged: (valor) {
        setState(() {
          _bloquearChek = valor;
        });
      },
    );
  }

  Widget _crearSwith() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _bloquearChek,
      onChanged: (valor) {
        setState(() {
          _bloquearChek = valor;
        });
      },
    );
  }
}
