import 'package:voxa/dominio/dto/dto_produto.dart';

abstract class IProdutoDAO {
  Future<DTOProduto> salvar(DTOProduto produto);
  Future<DTOProduto> alterar(DTOProduto produto);
  Future<bool> excluir(int id);
  Future<List<DTOProduto>> consultar();
  Future<DTOProduto?> consultarPorId(int id);
}
