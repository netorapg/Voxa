
import 'package:voxa/dominio/interface/i_dao_tamanho.dart';
import 'package:voxa/dominio/tamanho.dart';

abstract class AItem {
  late TamanhoRoupa tamanho;
  late IDAOTamanho dao;

  aTamanho({required tamanho, required dao});
  salvar() {
    tamanho.salvar();
  }
  alterar() {
    tamanho.alterar();
  }
  excluir() {
    tamanho.excluir();
  }
  consultar() {
    tamanho.consultar();
  }
}