import 'package:flutter/material.dart';

class FornecedorPage extends StatefulWidget {
  const FornecedorPage({super.key});

  @override
  State<FornecedorPage> createState() => _FornecedorPageState();
}

class _FornecedorPageState extends State<FornecedorPage> {
  // Lista de fornecedores para demonstração
  final List<Map<String, String>> fornecedores = [
    {
      'razaoSocial': 'Fornecedor A',
      'nomeFantasia': 'Fantasia A',
      'cnpj': '11.222.333/0001-44',
      'endereco': 'Rua Principal, 123',
      'telefone': '(11) 99999-9999',
      'email': 'fornecedorA@email.com',
    },
    {
      'razaoSocial': 'Fornecedor B',
      'nomeFantasia': 'Fantasia B',
      'cnpj': '22.333.444/0002-55',
      'endereco': 'Avenida Secundária, 456',
      'telefone': '(22) 88888-8888',
      'email': 'fornecedorB@email.com',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fornecedores'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addFornecedor,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: fornecedores.length,
        itemBuilder: (context, index) {
          final fornecedor = fornecedores[index];
          return Card(
            child: ListTile(
              title: Text(fornecedor['razaoSocial'] ?? ''),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome Fantasia: ${fornecedor['nomeFantasia']}'),
                  Text('CNPJ: ${fornecedor['cnpj']}'),
                  Text('Endereço: ${fornecedor['endereco']}'),
                  Text('Telefone: ${fornecedor['telefone']}'),
                  Text('Email: ${fornecedor['email']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _editFornecedor(index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteFornecedor(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _addFornecedor() {
    _showFornecedorDialog();
  }

  void _editFornecedor(int index) {
    _showFornecedorDialog(editIndex: index);
  }

  void _deleteFornecedor(int index) {
    setState(() {
      fornecedores.removeAt(index);
    });
  }

  void _showFornecedorDialog({int? editIndex}) {
    final TextEditingController razaoSocialController = TextEditingController();
    final TextEditingController nomeFantasiaController = TextEditingController();
    final TextEditingController cnpjController = TextEditingController();
    final TextEditingController enderecoController = TextEditingController();
    final TextEditingController telefoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    if (editIndex != null) {
      final fornecedor = fornecedores[editIndex];
      razaoSocialController.text = fornecedor['razaoSocial'] ?? '';
      nomeFantasiaController.text = fornecedor['nomeFantasia'] ?? '';
      cnpjController.text = fornecedor['cnpj'] ?? '';
      enderecoController.text = fornecedor['endereco'] ?? '';
      telefoneController.text = fornecedor['telefone'] ?? '';
      emailController.text = fornecedor['email'] ?? '';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(editIndex == null ? 'Adicionar Fornecedor' : 'Editar Fornecedor'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: razaoSocialController,
                  decoration: const InputDecoration(labelText: 'Razão Social'),
                ),
                TextField(
                  controller: nomeFantasiaController,
                  decoration: const InputDecoration(labelText: 'Nome Fantasia'),
                ),
                TextField(
                  controller: cnpjController,
                  decoration: const InputDecoration(labelText: 'CNPJ'),
                ),
                TextField(
                  controller: enderecoController,
                  decoration: const InputDecoration(labelText: 'Endereço'),
                ),
                TextField(
                  controller: telefoneController,
                  decoration: const InputDecoration(labelText: 'Telefone'),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final fornecedor = {
                  'razaoSocial': razaoSocialController.text,
                  'nomeFantasia': nomeFantasiaController.text,
                  'cnpj': cnpjController.text,
                  'endereco': enderecoController.text,
                  'telefone': telefoneController.text,
                  'email': emailController.text,
                };
                setState(() {
                  if (editIndex == null) {
                    fornecedores.add(fornecedor);
                  } else {
                    fornecedores[editIndex] = fornecedor;
                  }
                });
                Navigator.pop(context);
              },
              child: Text(editIndex == null ? 'Adicionar' : 'Salvar'),
            ),
          ],
        );
      },
    );
  }
}
