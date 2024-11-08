import 'package:flutter/material.dart';
import 'package:voxa/dominio/dto/dto_cor.dart';
import 'package:voxa/dominio/interface/i_dao_cor.dart';
import 'package:voxa/dominio/cor.dart';

class CorTela extends StatefulWidget {

  const CorTela({super.key});

  @override
  _CorTelaState createState() => _CorTelaState();
}

class _CorTelaState extends State<CorTela> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  CorRoupa? _corRoupa;
  List<DTOCor> _listaCor = [];

  @override
  void initState() {
    super.initState();
    _consultarCor();
  }

  Future<void> _consultarCor() async {
    try {
      final cor = await _corRoupa?.consultar();
      setState(() {
        _listaCor = cor ?? [];
      });
    } catch (e) {
      _mostrarErro(e.toString());
    }
  }

  Future<void> _salvarCor() async {
    if (_formKey.currentState!.validate()) {
      try {
        _corRoupa?.nome = _nomeController.text;
        await _corRoupa?.salvar();
        _consultarCor();
        _limparCampos();
      } catch (e) {
        _mostrarErro(e.toString());
      }
    }
  }

  Future<void> _alterarCor(DTOCor cor) async {
    try {
      _corRoupa?.id = cor.id;
      _corRoupa?.nome = _nomeController.text;
      await _corRoupa?.alterar();
      _consultarCor();
    } catch (e) {
      _mostrarErro(e.toString());
    }
  }

  Future<void> _excluirCor(dynamic id) async {
    try {
      await _corRoupa?.excluir();
      _consultarCor();
    } catch (e) {
      _mostrarErro(e.toString());
    }
  }

  void _limparCampos() {
    _nomeController.clear();
    _corRoupa?.id = null;
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
        title: const Text('Gerenciar Cores de Roupa'),
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
                    decoration: const InputDecoration(labelText: 'Nome da Cor'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um nome';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _salvarCor,
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _listaCor.length,
                itemBuilder: (context, index) {
                  final cor = _listaCor[index];
                  return ListTile(
                    title: Text(cor.nome),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _nomeController.text = cor.nome;
                            _alterarCor(cor);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _excluirCor(cor.id),
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
