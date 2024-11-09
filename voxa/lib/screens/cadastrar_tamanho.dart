import 'package:flutter/material.dart';
import 'package:voxa/dominio/dto/dto_tamanho.dart';
import 'package:voxa/services/database_service.dart';

class AdicionarTamanhoPage extends StatelessWidget {
  final TamanhoRoupaDatabaseService dao;

  AdicionarTamanhoPage({super.key, required this.dao, required DTOTamanho? tamanho});

  final TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Tamanho'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Tamanho'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final nome = _nomeController.text;
                if (nome.isNotEmpty) {
                  final dto = DTOTamanho(nome: nome);
                  await dao.salvar(dto);
                  Navigator.pop(context); // Retorna para a tela anterior
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
