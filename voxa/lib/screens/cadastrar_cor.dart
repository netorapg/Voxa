import 'package:flutter/material.dart';
import 'package:voxa/dominio/dto/dto_cor.dart';
import 'package:voxa/services/database_service.dart';

class AdicionarCorPage extends StatelessWidget {
  final CorDatabaseService dao;

  AdicionarCorPage({super.key, required this.dao});

  final TextEditingController _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Cor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome da Cor'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final nome = _nomeController.text;
                if (nome.isNotEmpty) {
                  final dto = DTOCor(nome: nome);
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
