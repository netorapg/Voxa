import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxa/backgroundImage.dart';
import 'package:voxa/rota.dart';
import 'package:voxa/utilitarios.dart';
import 'package:voxa/widget/cadastro.dart';

class Estoque extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estoque')),
      body: Column(
        children: [
          const Text('Estoque'),
          Utilitarios().criarBotaoDeNavegacao(
              nome: 'Informações do produto',
              contexto: context,
              rota: Rota.info),
          Utilitarios().criarBotaoDeNavegacao(
              nome: 'Cadastrar Novo Produto',
              contexto: context,
              rota: Rota.cadastro),
        ],
      ),
    );
  }
}
