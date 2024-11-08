import 'package:flutter/material.dart';
import 'package:voxa/dominio/dto/dto_tipo.dart';
import 'package:voxa/dominio/interface/i_dao_tipo.dart';
import 'package:voxa/dominio/tipo.dart'; // Import da classe TipoRoupa

class TipoRoupaScreen extends StatefulWidget {
  final IDAOTipoRoupa dao;

  const TipoRoupaScreen({super.key, required this.dao});

  @override
  _TipoRoupaScreenState createState() => _TipoRoupaScreenState();
}

class _TipoRoupaScreenState extends State<TipoRoupaScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  TipoRoupa? _tipoRoupa;
  List<DTOTipoRoupa> _listaTipos = [];

  @override
  void initState() {
    super.initState();
    _tipoRoupa = TipoRoupa(dao: widget.dao);
    _consultarTipos();
  }

  Future<void> _consultarTipos() async {
    try {
      final tipos = await _tipoRoupa?.consultar();
      setState(() {
        _listaTipos = tipos ?? [];
      });
    } catch (e) {
      _mostrarErro(e.toString());
    }
  }

  Future<void> _salvarTipoRoupa() async {
    if (_formKey.currentState!.validate()) {
      try {
        _tipoRoupa?.nome = _nomeController.text;
        await _tipoRoupa?.salvar();
        _consultarTipos();
        _limparCampos();
      } catch (e) {
        _mostrarErro(e.toString());
      }
    }
  }

  Future<void> _alterarTipoRoupa(DTOTipoRoupa tipo) async {
    try {
      _tipoRoupa?.id = tipo.id;
      _tipoRoupa?.nome = _nomeController.text;
      await _tipoRoupa?.alterar();
      _consultarTipos();
      _limparCampos();
    } catch (e) {
      _mostrarErro(e.toString());
    }
  }

  Future<void> _excluirTipoRoupa(dynamic id) async {
    try {
      await _tipoRoupa?.excluir();
      _consultarTipos();
    } catch (e) {
      _mostrarErro(e.toString());
    }
  }

  void _limparCampos() {
    _nomeController.clear();
    _tipoRoupa?.id = null;
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Tipos de Roupa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(labelText: 'Nome do Tipo de Roupa'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um nome';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _salvarTipoRoupa,
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _listaTipos.length,
                itemBuilder: (context, index) {
                  final tipo = _listaTipos[index];
                  return ListTile(
                    title: Text(tipo.nome),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _nomeController.text = tipo.nome;
                            _alterarTipoRoupa(tipo);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _excluirTipoRoupa(tipo.id),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
