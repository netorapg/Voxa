

import 'package:voxa/dominio/dto/dto_produto.dart';
import 'package:voxa/dominio/interface/i_dao_produto.dart';

class DAOProduto implements IProdutoDAO {
  final List<DTOProduto> _produtos = [];

  @override
  Future<DTOProduto> salvar(DTOProduto produto) async {
    produto.id = _produtos.isEmpty ? 1 : _produtos.last.id! + 1;
    _produtos.add(produto);
    return produto;
  }

  @override
  Future<DTOProduto> alterar(DTOProduto produto) async {
    final index = _produtos.indexWhere((p) => p.id == produto.id);
    if (index == -1) {
      throw Exception('Produto não encontrado');
    }
    _produtos[index] = produto;
    return produto;
  }

  @override
  Future<bool> excluir(int id) async {
    final index = _produtos.indexWhere((p) => p.id == id);
    if (index == -1) {
      throw Exception('Produto não encontrado');
    }
    _produtos.removeAt(index);
    return true;
  }

  @override
  Future<List<DTOProduto>> consultar() async {
    return _produtos;
  }

  @override
  Future<DTOProduto?> consultarPorId(int id) async {
    return _produtos.firstWhere((p) => p.id == id, orElse: () => null);
  }
}
