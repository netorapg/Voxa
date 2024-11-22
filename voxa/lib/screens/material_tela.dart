import 'package:flutter/material.dart';
import 'package:voxa/dominio/dto/dto_material.dart';
import 'package:voxa/services/database_service.dart';

class MaterialPage extends StatefulWidget {
  const MaterialPage({super.key});

  @override
  _MaterialPageState createState() => _MaterialPageState();
}

class _MaterialPageState extends State<MaterialPage> {
  final MaterialDatabaseService _dao = MaterialDatabaseService();
  List<DTOMaterial> _materiais = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _carregarMateriais();
  }

  Future<void> _carregarMateriais() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _materiais = await _dao.consultar();
    } catch (e) {
      print('Erro ao carregar material: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _excluirMateriais(int id) async {
    try {
      await _dao.excluir(id);
      _carregarMateriais(); // Atualiza a lista após exclusão
    } catch (e) {
      print('Erro ao excluir material: $e');
    }
  }

  void _editarMateriais(DTOMaterial tipo) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nomeController = TextEditingController(text: tipo.nome);

        return AlertDialog(
          title: const Text('Editar Material'),
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
                    await _dao.alterar(DTOMaterial(id: tipo.id, nome: novoNome));
                    _carregarMateriais();
                    Navigator.of(context).pop();
                  } catch (e) {
                    print('Erro ao atualizar material: $e');
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

  void _adicionarMateriais() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nomeController = TextEditingController();

        return AlertDialog(
          title: const Text('Adicionar Material'),
          content: TextField(
            controller: nomeController,
            decoration: const InputDecoration(labelText: 'Nome do Material'),
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
                    await _dao.salvar(DTOMaterial(nome: nome));
                    _carregarMateriais();
                    Navigator.of(context).pop();
                  } catch (e) {
                    print('Erro ao adicionar material: $e');
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
        title: const Text('Lista de Materiais'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _adicionarMateriais,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _materiais.length,
              itemBuilder: (context, index) {
                final material = _materiais[index];
                return ListTile(
                  title: Text(material.nome),
                  subtitle: Text('ID: ${material.id}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editarMateriais(material),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _excluirMateriais(material.id!),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
