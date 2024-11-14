import 'package:flutter/material.dart';
import 'package:voxa/dominio/dto/dto_tamanho.dart';
import 'package:voxa/screens/cadastrar_tamanho.dart';
import 'package:voxa/services/database_service.dart';

class TamanhoListPage extends StatefulWidget {

  const TamanhoListPage({super.key});

  @override
  _TamanhoListPageState createState() => _TamanhoListPageState();
}

class _TamanhoListPageState extends State<TamanhoListPage> {
  final TamanhoRoupaDatabaseService _dao = TamanhoRoupaDatabaseService();
  List<DTOTamanho> _tamanhos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _carregarTamanhos();
  }

  Future<void> _carregarTamanhos() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _tamanhos = await _dao.consultar();
    } catch (e) {
      print('Erro ao carregar tamanhos: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _excluirTamanho(int id) async {
    try {
      await _dao.excluir(id);
      _carregarTamanhos(); // Atualiza a lista após exclusão
    } catch (e) {
      print('Erro ao excluir tamanho: $e');
    }
  }

  void _editarTamanho(DTOTamanho tamanho) {
    showDialog(
      context: context,
      builder: (context) {
      final TextEditingController nomeController = TextEditingController(text: tamanho.nome);

      return AlertDialog(
        title: const Text('Editar Tamanho'),
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
            await _dao.alterar(DTOTamanho(id: tamanho.id, nome: novoNome));
            _carregarTamanhos();
            Navigator.of(context).pop();
            } catch (e) {
            print('Erro ao atualizar tamanho: $e');
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
        title: const Text('Lista de Tamanhos'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _tamanhos.length,
              itemBuilder: (context, index) {
                final tamanho = _tamanhos[index];
                return ListTile(
                  title: Text(tamanho.nome),
                  subtitle: Text('ID: ${tamanho.id}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editarTamanho(tamanho),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _excluirTamanho(tamanho.id!),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdicionarTamanhoPage(dao: _dao, tamanho: null),
            ),
          ).then((_) {
            _carregarTamanhos(); // Recarrega a lista após adicionar um novo tamanho
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
