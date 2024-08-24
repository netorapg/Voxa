import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _tamanhosController = TextEditingController();
  final TextEditingController _coresController = TextEditingController();
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _fornecedorController = TextEditingController();
  File? _imagem;

  // Simulando o estoque para verificação de duplicação
  final List<Map<String, String>> _estoque = [];

  bool _isDuplicated() {
    return _estoque.any((produto) =>
        produto['tipo'] == _tipoController.text &&
        produto['tamanhos'] == _tamanhosController.text &&
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
        'tipo': _tipoController.text,
        'tamanhos': _tamanhosController.text,
        'cores': _coresController.text,
        'marca': _marcaController.text,
        'material': _materialController.text,
        'quantidade': _quantidadeController.text,
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
              _buildDraftItem('Tipo', _tipoController.text, _tipoController),
              _buildDraftItem('Tamanhos', _tamanhosController.text, _tamanhosController),
              _buildDraftItem('Cores', _coresController.text, _coresController),
              _buildDraftItem('Marca', _marcaController.text, _marcaController),
              _buildDraftItem('Material', _materialController.text, _materialController),
              _buildDraftItem('Quantidade', _quantidadeController.text, _quantidadeController),
              _buildDraftItem('Fornecedor', _fornecedorController.text, _fornecedorController),
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

  Widget _buildDraftItem(String label, String value, TextEditingController controller) {
    return Row(
      children: [
        Expanded(child: Text('$label: $value')),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Navigator.of(context).pop();
            _editField(controller, label);
          },
        ),
      ],
    );
  }

  void _editField(TextEditingController controller, String label) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar $label'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: label),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
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
      appBar: AppBar(title: const Text('Cadastrar Novo Produto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _tipoController,
                decoration: const InputDecoration(labelText: 'Tipo'),
                validator: (value) => value?.isEmpty ?? true ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                controller: _tamanhosController,
                decoration: const InputDecoration(labelText: 'Tamanhos'),
                validator: (value) => value?.isEmpty ?? true ? 'Campo obrigatório' : null,
              ),
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
              TextFormField(
                controller: _quantidadeController,
                decoration: const InputDecoration(labelText: 'Quantidade em Estoque'),
                keyboardType: TextInputType.number,
                validator: (value) => value?.isEmpty ?? true ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                controller: _fornecedorController,
                decoration: const InputDecoration(labelText: 'Fornecedor'),
                validator: (value) => value?.isEmpty ?? true ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 16.0),
              if (_imagem == null)
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Tirar Foto'),
                )
              else
                Column(
                  children: [
                    Image.file(_imagem!),
                    TextButton(
                      onPressed: _pickImage,
                      child: const Text('Retirar Foto'),
                    ),
                  ],
                ),
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
