import 'package:flutter/material.dart';
import 'package:voxa/dominio/dto/dto_tamanho.dart';
import 'package:voxa/screens/cadastrar_tamanho.dart';
import 'package:voxa/services/database_service.dart'; // Ajuste o caminho conforme necessário

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
      // Trate o erro, se necessário
      print('Erro ao carregar tamanhos: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
                  // Adicione ações, se necessário
                  onTap: () {
                    // Aqui você pode adicionar lógica para editar ou excluir o tamanho
                  },
                );
              },
            ),
     floatingActionButton: FloatingActionButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdicionarTamanhoPage(dao: _dao)),
    ).then((_) {
      // Recarregue a lista após adicionar um novo tamanho
      _carregarTamanhos();
    });
  },
  child: const Icon(Icons.add),
),

    );
  }
}
