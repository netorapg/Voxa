import 'package:flutter/material.dart';
import 'package:voxa/widget/rota.dart';

class Estoque extends StatelessWidget {
  const Estoque({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 246, 230),
      appBar: AppBar(title: const Text('Voxa')),
      body: Column(
        children: [
          // Coloque aqui os widgets que você quer na parte superior da tela

          // Adiciona os botões na parte de baixo
          Spacer(), // Preenche o espaço restante para empurrar os botões para baixo
          Wrap(
            alignment: WrapAlignment.center, // Alinha os botões no centro
            spacing: 10, // Espaçamento horizontal entre os botões
            runSpacing: 10, // Espaçamento vertical entre os grupos de botões
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navega para a tela de Tipo de Roupa
                  Navigator.pushNamed(context, Rota.tipo);
                },
                child: const Text('Tipo de Roupa'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navega para a tela de Tamanho de Roupa
                  Navigator.pushNamed(context, Rota.tamanhoTela);
                },
                child: const Text('Tamanho de Roupa'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navega para a tela de Cor
                  Navigator.pushNamed(context, Rota.tamanhoTela);
                },
                child: const Text('Material'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navega para a tela de Cor
                  Navigator.pushNamed(context, Rota.tamanhoTela);
                },
                child: const Text('Fornecedor'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navega para a tela de Cor
                  Navigator.pushNamed(context, Rota.tamanhoTela);
                },
                child: const Text('Marca'),
              ),
            ],
          ),
          SizedBox(height: 20), // Espaço adicional abaixo dos botões
        ],
      ),
    );
  }
}
