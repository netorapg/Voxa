import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:voxa/dominio/dto/dto_cor.dart';
import 'package:voxa/dominio/cor.dart';

class CorTela extends StatefulWidget {
  const CorTela({super.key});

  @override
  _CorTelaState createState() => _CorTelaState();
}

class _CorTelaState extends State<CorTela> {
  final _formKey = GlobalKey<FormState>();
  CorRoupa? _corRoupa;
  List<DTOCor> _listaCor = [];
  Color _currentColor = Colors.blue; // Cor padrão inicial
  String _corNome = 'Blue'; // Nome da cor inicial

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
        _corRoupa?.nome = _corNome;
        _corRoupa?.corHex = _currentColor.value.toRadixString(16);
        await _corRoupa?.salvar();
        _consultarCor();
        _limparCampos();
      } catch (e) {
        _mostrarErro(e.toString());
      }
    }
  }

  void _limparCampos() {
    setState(() {
      _currentColor = Colors.blue;
      _corNome = 'Blue';
    });
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  // Mapeia a cor selecionada para um nome comum, se disponível
  String _getColorName(Color color) {
    Map<Color, String> colorNames = {
      Colors.red: 'Red',
      Colors.green: 'Green',
      Colors.blue: 'Blue',
      Colors.yellow: 'Yellow',
      Colors.orange: 'Orange',
      Colors.purple: 'Purple',
      Colors.black: 'Black',
      Colors.white: 'White',
      // Adicione outras cores conforme necessário
    };
    return colorNames[color] ?? 'Custom Color';
  }

  // Método para abrir o ColorPicker e definir o nome da cor
  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecione a Cor'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _currentColor,
              onColorChanged: (Color color) {
                setState(() {
                  _currentColor = color;
                  _corNome = _getColorName(color);
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Selecionar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _showColorPicker,
                        child: Container(
                          width: 50,
                          height: 50,
                          color: _currentColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        _corNome,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: _salvarCor,
                        child: const Text('Salvar'),
                      ),
                    ],
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
                    leading: Container(
                      width: 20,
                      height: 20,
                      color: Color(int.parse(cor.corHex, radix: 16) | 0xFF000000),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _corNome = cor.nome;
                            _currentColor = Color(int.parse(cor.corHex, radix: 16) | 0xFF000000);
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
