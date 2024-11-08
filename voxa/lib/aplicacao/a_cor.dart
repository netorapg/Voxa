import 'package:voxa/dominio/cor.dart';
import 'package:voxa/dominio/interface/i_dao_cor.dart';

abstract class AItem {
  late CorRoupa cor;
  late IDAOCor dao;

  aTamanho({required cor, required dao});
  salvar() {
    cor.salvar();
  }
  alterar() {
    cor.alterar();
  }
  excluir() {
    cor.excluir();
  }
  consultar() {
    cor.consultar();
  }
}