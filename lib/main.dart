import 'package:flutter/material.dart';
import 'package:quiz_flutter/Resultado.dart';
import './questinario.dart';

void main() async {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _notaTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual e sua cor preferida?',
      'resposta': [
        {'texto': 'Vermelho', 'nota': 10},
        {'texto': 'Azul', 'nota': 9},
        {'texto': 'Amarelo', 'nota': 8},
        {'texto': 'Roxo', 'nota': 11},
      ]
    },
    {
      'texto': 'Qual e seu animal preferido?',
      'resposta': [
        {'texto': 'Cachorro', 'nota': 10},
        {'texto': 'Gato', 'nota': 7},
        {'texto': 'Tartaruga', 'nota': 5},
        {'texto': 'Pardal', 'nota': 8},
      ]
    },
    {
      'texto': 'Qual e sua comida preferida?',
      'resposta': [
        {'texto': 'Strogonoff', 'nota': 10},
        {'texto': 'X-Burger', 'nota': 10},
        {'texto': 'Macarrão', 'nota': 10},
        {'texto': 'Salada', 'nota': 3},
      ]
    }
  ];

  void _responde(int nota) {
    if (isCheck)
      setState(() {
        _perguntaSelecionada++;
        _notaTotal += nota;
      });
    print("Clicado $_notaTotal");
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _notaTotal = 0;
    });
  }

  bool get isCheck {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Quizz Treinamento')),
          body: isCheck
              ? Questinario(
                  perguntaSelecionada: _perguntaSelecionada,
                  perguntas: _perguntas,
                  responder: _responde)
              : Resultado(_notaTotal, _reiniciar)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
