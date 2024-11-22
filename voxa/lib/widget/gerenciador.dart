import 'package:flutter/material.dart';

class GerenciadorListaPage<T> extends StatefulWidget {
  final String titulo;
  final String nomeItem;
  final Future<List<T>> Function() carregarItens;
  final Future<void> Function(int) excluirItem;
  final Future<void> Function(T) salvarItem;
  final Future<void> Function(T) alterarItem;
  final String Function(T) obterNome;
  final int? Function(T) obterId;
  final T Function(String nome) criarItem;

  const GerenciadorListaPage({
    super.key,
    required this.titulo,
    required this.nomeItem,
    required this.carregarItens,
    required this.excluirItem,
    required this.salvarItem,
    required this.alterarItem,
    required this.obterNome,
    required this.obterId,
    required this.criarItem,
  });

  @override
  _GerenciadorListaPageState<T> createState() =>
      _GerenciadorListaPageState<T>();
}

class _GerenciadorListaPageState<T> extends State<GerenciadorListaPage<T>> {
  late List<T> _itens = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _carregarItens();
  }

  Future<void> _carregarItens() async {
    setState(() => _isLoading = true);
    try {
      _itens = await widget.carregarItens();
    } catch (e) {
      print('Erro ao carregar ${widget.nomeItem.toLowerCase()}: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _excluirItem(int id) async {
    try {
      await widget.excluirItem(id);
      setState(() {
        _itens.removeWhere((item) => widget.obterId(item) == id);
      });
    } catch (e) {
      print('Erro ao excluir ${widget.nomeItem.toLowerCase()}: $e');
    }
  }

  void _editarItem(T item) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nomeController =
            TextEditingController(text: widget.obterNome(item));

        return AlertDialog(
          title: Text('Editar ${widget.nomeItem}'),
          content: TextField(
            controller: nomeController,
            decoration:
                InputDecoration(labelText: 'Nome do ${widget.nomeItem}'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                final String novoNome = nomeController.text.trim();
                if (novoNome.isNotEmpty) {
                  try {
                    final T itemAlterado = widget.criarItem(novoNome);
                    await widget.alterarItem(itemAlterado);
                    await _carregarItens();
                    Navigator.of(context).pop();
                  } catch (e) {
                    print('Erro ao editar ${widget.nomeItem.toLowerCase()}: $e');
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

  void _adicionarItem() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nomeController = TextEditingController();

        return AlertDialog(
          title: Text('Adicionar ${widget.nomeItem}'),
          content: TextField(
            controller: nomeController,
            decoration:
                InputDecoration(labelText: 'Nome do ${widget.nomeItem}'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                final String nome = nomeController.text.trim();
                if (nome.isNotEmpty) {
                  try {
                    final T novoItem = widget.criarItem(nome);
                    await widget.salvarItem(novoItem);
                    await _carregarItens();
                    Navigator.of(context).pop();
                  } catch (e) {
                    print('Erro ao adicionar ${widget.nomeItem.toLowerCase()}: $e');
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
        title: Text(widget.titulo),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _adicionarItem,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _itens.length,
              itemBuilder: (context, index) {
                final item = _itens[index];
                return ListTile(
                  title: Text(widget.obterNome(item)),
                  subtitle: Text('ID: ${widget.obterId(item) ?? "Não definido"}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editarItem(item),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          final id = widget.obterId(item);
                          if (id != null) _excluirItem(id);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
