import 'package:flutter/material.dart';
import 'package:voxa/dominio/dto/dto_marca.dart';
import 'package:voxa/services/database_service.dart';

class MarcaPage extends StatefulWidget {
  const MarcaPage({super.key});

  @override
  _MarcaPageState createState() => _MarcaPageState();
}

class _MarcaPageState extends State<MarcaPage> {
  final MarcaDatabaseService _dao = MarcaDatabaseService();
  List<DTOMarca> _marcas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _carregarMarcas();
  }

  Future<void> _carregarMarcas() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _marcas = await _dao.consultar();
    } catch (e) {
      print('Erro ao carregar marca: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _excluirMarcas(int id) async {
    try {
      await _dao.excluir(id);
      _carregarMarcas(); // Atualiza a lista após exclusão
    } catch (e) {
      print('Erro ao excluir marca: $e');
    }
  }

  void _editarMarca(DTOMarca tipo) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nomeController = TextEditingController(text: tipo.nome);

        return AlertDialog(
          title: const Text('Editar Marca'),
          content: TextField(
            controller: nomeController,
            decoration: const InputDecoration(labelText: 'Nome'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                final String novoNome = nomeController.text;
                if (novoNome.isNotEmpty) {
                  try {
                    await _dao.alterar(DTOMarca(id: tipo.id, nome: novoNome));
                    _carregarMarcas();
                    Navigator.of(context).pop();
                  } catch (e) {
                    print('Erro ao atualizar marca: $e');
                  }
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _adicionarMarcas() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nomeController = TextEditingController();

        return AlertDialog(
          title: const Text('Adicionar Marca'),
          content: TextField(
            controller: nomeController,
            decoration: const InputDecoration(labelText: 'Nome da Marca'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                final String nome = nomeController.text;
                if (nome.isNotEmpty) {
                  try {
                    await _dao.salvar(DTOMarca(nome: nome));
                    _carregarMarcas();
                    Navigator.of(context).pop();
                  } catch (e) {
                    print('Erro ao adicionar marcas: $e');
                  }
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Marcas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _adicionarMarcas,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _marcas.length,
              itemBuilder: (context, index) {
                final marca = _marcas[index];
                return ListTile(
                  title: Text(marca.nome),
                  subtitle: Text('ID: ${marca.id}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editarMarca(marca),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _excluirMarcas(marca.id!),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
