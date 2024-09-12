import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _coresController = TextEditingController();
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _fornecedorController = TextEditingController();
  int _quantidade = 0;
  File? _imagem;

  // Simulando o estoque para verificação de duplicação
  final List<Map<String, String>> _estoque = [];

  bool _isDuplicated() {
    return _estoque.any((produto) =>
        produto['tipo'] == _selectedTipo &&
        produto['cores'] == _coresController.text &&
        produto['marca'] == _marcaController.text &&
        produto['material'] == _materialController.text &&
        produto['fornecedor'] == _fornecedorController.text);
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imagem = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_imagem == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tire uma foto da peça para continuar.')),
        );
        return;
      }

      if (_isDuplicated()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Peça duplicada!')),
        );
        return;
      }

      _estoque.add({
        'tipo': _selectedTipo,
        'cores': _coresController.text,
        'marca': _marcaController.text,
        'material': _materialController.text,
        'quantidade': _quantidade.toString(),
        'fornecedor': _fornecedorController.text,
        'imagem': _imagem?.path ?? '',
      });

      _showDraft();
    }
  }

  void _showDraft() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Rascunho'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDraftItem('Tipo', _selectedTipo, _editTipo),
              _buildDraftItem('Cores', _coresController.text, _coresController as Function()),
              _buildDraftItem('Marca', _marcaController.text, _marcaController as Function()),
              _buildDraftItem('Material', _materialController.text, _materialController as Function()),
            // _buildDraftItem('Quantidade', _quantidade.toString(), _quantidadeController as Function()),
              _buildDraftItem('Fornecedor', _fornecedorController.text, _fornecedorController as Function()),
              if (_imagem != null)
                Column(
                  children: [
                    const Text('Imagem:'),
                    Image.file(_imagem!),
                  ],
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Editar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cadastro concluído!')),
                );
              },
              child: const Text('Concluir Cadastro'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDraftItem(String label, String value, Function() editFunction) {
    return Row(
      children: [
        Expanded(child: Text('$label: $value')),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: editFunction,
        ),
      ],
    );
  }

  String _selectedTipo = '';

  void _editTipo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Tipo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: const Text('Camisa'),
                value: 'Camisa',
                groupValue: _selectedTipo,
                onChanged: (value) {
                  setState(() {
                    _selectedTipo = value.toString();
                  });
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile(
                title: const Text('Camiseta'),
                value: 'Camiseta',
                groupValue: _selectedTipo,
                onChanged: (value) {
                  setState(() {
                    _selectedTipo = value.toString();
                  });
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile(
                title: const Text('Vestido'),
                value: 'Vestido',
                groupValue: _selectedTipo,
                onChanged: (value) {
                  setState(() {
                    _selectedTipo = value.toString();
                  });
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile(
                title: const Text('Calça Jeans'),
                value: 'Calça Jeans',
                groupValue: _selectedTipo,
                onChanged: (value) {
                  setState(() {
                    _selectedTipo = value.toString();
                  });
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile(
                title: const Text('Jaqueta'),
                value: 'Jaqueta',
                groupValue: _selectedTipo,
                onChanged: (value) {
                  setState(() {
                    _selectedTipo = value.toString();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _editTamanhos() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Editar Tamanhos'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    title: const Text('P'),
                    value: _selectedSizes.contains('P'),
                    onChanged: (value) {
                      setState(() => _toggleSize('P'));
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('M'),
                    value: _selectedSizes.contains('M'),
                    onChanged: (value) {
                      setState(() => _toggleSize('M'));
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('G'),
                    value: _selectedSizes.contains('G'),
                    onChanged: (value) {
                      setState(() => _toggleSize('G'));
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('GG'),
                    value: _selectedSizes.contains('GG'),
                    onChanged: (value) {
                      setState(() => _toggleSize('GG'));
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('XGG'),
                    value: _selectedSizes.contains('XGG'),
                    onChanged: (value) {
                      setState(() => _toggleSize('XGG'));
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  final List<String> _selectedSizes = [];
  String _selectedTamanhos = '';

  void _toggleSize(String size) {
    setState(() {
      if (_selectedSizes.contains(size)) {
        _selectedSizes.remove(size);
      } else {
        _selectedSizes.add(size);
      }
      _selectedTamanhos = _selectedSizes.join(', ');  // Atualiza a string com os tamanhos selecionados
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Novo Produto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildDraftItem('Tipo', _selectedTipo, _editTipo),
              _buildDraftItem('Tamanhos', _selectedTamanhos, _editTamanhos),
              TextFormField(
                controller: _coresController,
                decoration: const InputDecoration(labelText: 'Cores'),
                validator: (value) => value?.isEmpty ?? true ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                controller: _marcaController,
                decoration: const InputDecoration(labelText: 'Marca'),
                validator: (value) => value?.isEmpty ?? true ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                controller: _materialController,
                decoration: const InputDecoration(labelText: 'Material'),
                validator: (value) => value?.isEmpty ?? true ? 'Campo obrigatório' : null,
              ),
              const Text('Quantidade em Estoque'),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (_quantidade > 0) _quantidade--;
                      });
                    },
                  ),
                  Text('$_quantidade'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _quantidade++;
                      });
                    },
                  ),
                ],
              ),
              TextFormField(
                controller: _fornecedorController,
                decoration: const InputDecoration(labelText: 'Fornecedor'),
                validator: (value) => value?.isEmpty ?? true ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _pickImage,
                child: const Text('Tirar Foto da Peça'),
              ),
              if (_imagem != null) Image.file(_imagem!),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
