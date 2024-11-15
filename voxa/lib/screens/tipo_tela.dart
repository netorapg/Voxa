import 'package:flutter/material.dart';
import 'package:voxa/dominio/dto/dto_tipo.dart';
import 'package:voxa/services/database_service.dart';

class TipoPage extends StatefulWidget {
  const TipoPage({super.key});

  @override
  _TipoPageState createState() => _TipoPageState();
}

class _TipoPageState extends State<TipoPage> {
  final TipoRoupaDatabaseService _dao = TipoRoupaDatabaseService();
  List<DTOTipoRoupa> _tipos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _carregarTipos();
  }

  Future<void> _carregarTipos() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _tipos = await _dao.consultar();
    } catch (e) {
      print('Erro ao carregar tipos: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _excluirTipo(int id) async {
    try {
      await _dao.excluir(id);
      _carregarTipos(); // Atualiza a lista após exclusão
    } catch (e) {
      print('Erro ao excluir tipo: $e');
    }
  }

  void _editarTipo(DTOTipoRoupa tipo) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nomeController = TextEditingController(text: tipo.nome);

        return AlertDialog(
          title: const Text('Editar Tipo'),
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
                    await _dao.alterar(DTOTipoRoupa(id: tipo.id, nome: novoNome));
                    _carregarTipos();
                    Navigator.of(context).pop();
                  } catch (e) {
                    print('Erro ao atualizar tipo: $e');
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

  void _adicionarTipo() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nomeController = TextEditingController();

        return AlertDialog(
          title: const Text('Adicionar Tipo'),
          content: TextField(
            controller: nomeController,
            decoration: const InputDecoration(labelText: 'Nome do Tipo'),
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
                    await _dao.salvar(DTOTipoRoupa(nome: nome));
                    _carregarTipos();
                    Navigator.of(context).pop();
                  } catch (e) {
                    print('Erro ao adicionar tipo: $e');
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
        title: const Text('Lista de Tipos'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _tipos.length,
              itemBuilder: (context, index) {
                final tipo = _tipos[index];
                return ListTile(
                  title: Text(tipo.nome),
                  subtitle: Text('ID: ${tipo.id}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editarTipo(tipo),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _excluirTipo(tipo.id!),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarTipo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
