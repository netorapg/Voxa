
import 'package:voxa/dominio/interface/i_dao_tipo.dart';
import 'package:voxa/dominio/tipo.dart';

abstract class AItem {
  late TipoRoupa tipo;
  late IDAOTipoRoupa dao;

  aTamanho({required tipo, required dao});
  salvar() {
    tipo.salvar();
  }
  alterar() {
    tipo.alterar();
  }
  excluir() {
    tipo.excluir();
  }
  consultar() {
    tipo.consultar();
  }
}