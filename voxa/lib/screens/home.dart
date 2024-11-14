import 'package:flutter/material.dart';
import 'package:voxa/widget/rota.dart';
import 'package:voxa/widget/utilitarios.dart';

class Estoque extends StatelessWidget {
  const Estoque({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 62, 110, 65),
      appBar: AppBar(title: const Text('Voxa')),
      body: Column(
        children: [
          Utilitarios().criarBotaoDeNavegacao(
              nome: 'Tipo de Roupa',
              contexto: context,
              rota: Rota.tipo),
          Utilitarios().criarBotaoDeNavegacao(
              nome: 'Tamanho de Roupa',
              contexto: context,
              rota: Rota.tamanhoTela),
         // Utilitarios().criarTabela(),
        ],
      ),
    );
  }
}
