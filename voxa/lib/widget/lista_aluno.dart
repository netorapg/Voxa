import 'package:flutter/material.dart';
import 'package:voxa/app.dart';
import 'package:voxa/rota.dart';
import 'package:voxa/utilitarios.dart';
import 'package:voxa/widget/formulario_aluno.dart';

class ListaAluno extends StatelessWidget {
  const ListaAluno({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista Aluno')),
      body: Column(
        children: [
          const Text('Lista Aluno'),
          Utilitarios()
              .criarBotaoDeRetorno(nome: 'Voltar', contexto: context),
          Utilitarios().
          criarBotaoDeNavegacao(nome: 'home', contexto: context, rota: Rota.home)
        ],
      ),
    );
  }
}
