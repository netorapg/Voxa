
import 'package:voxa/dominio/interface/i_dao_marca.dart';
import 'package:voxa/dominio/marca.dart';

abstract class AItem {
  late Marca marca;
  late IDAOMarca dao;

  aMarca({required marca, required dao});
  salvar() {
    marca.salvar();
  }
  alterar() {
    marca.alterar();
  }
  excluir() {
    marca.excluir();
  }
  consultar() {
    marca.consultar();
  }
}