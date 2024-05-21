import 'package:flutter/material.dart';
import 'package:voxa/rota.dart';
import 'package:voxa/utilitarios.dart';

class Estoque extends StatelessWidget {
  const Estoque({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estoque')),
      body: Column(
        children: [
          Utilitarios().criarBotaoDeNavegacao(
              nome: 'Informações do produto',
              contexto: context,
              rota: Rota.info),
          Utilitarios().criarBotaoDeNavegacao(
              nome: 'Cadastrar Novo Produto',
              contexto: context,
              rota: Rota.cadastro),
         // Utilitarios().criarTabela(),
        ],
      ),
    );
  }
}
