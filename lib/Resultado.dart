import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciar;

  Resultado(this.pontuacao, this.reiniciar);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Parabéns! Sua nota é $pontuacao',
              style: TextStyle(fontSize: 28),
            ),
          ),
          FlatButton(
            onPressed: reiniciar,
            child: Text('Reiniciar?', style: TextStyle(fontSize: 18)),
            textColor: Colors.blue,
          )
        ]);
  }
}
