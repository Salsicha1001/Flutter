import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questinario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questinario({
      required this.perguntaSelecionada,
      required this.perguntas,
      required this.responder});

  bool get isCheck {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        isCheck ? perguntas[perguntaSelecionada].cast()['resposta'] : [];
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Respostas(
            resp['texto'].toString(),
            ()=> responder(resp['nota'] as int),
          );
        }).toList(),
      ],
    );
  }
}

