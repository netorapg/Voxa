import 'package:voxa/dominio/dto/dto_fornecedor.dart';

abstract class IDAOFornecedor {
  Future<DTOFornecedor> salvar(DTOFornecedor dto);
  Future<DTOFornecedor> alterar(DTOFornecedor dto);
  Future<bool> excluir(dynamic id);
  Future<List<DTOFornecedor>> consultar();
}
