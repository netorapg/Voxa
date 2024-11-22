
import 'package:voxa/dominio/interface/i_dao_fornecedor.dart';
import 'package:voxa/dominio/fornecedor.dart';

abstract class AItem {
  late Fornecedor fornecedor;
  late IDAOFornecedor dao;

  aFornecedor({required fornecedor, required dao});
  salvar() {
    fornecedor.salvar();
  }
  alterar() {
    fornecedor.alterar();
  }
  excluir() {
    fornecedor.excluir();
  }
  consultar() {
    fornecedor.consultar();
  }
}