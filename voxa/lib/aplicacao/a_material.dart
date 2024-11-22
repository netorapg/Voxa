
import 'package:voxa/dominio/interface/i_dao_material.dart';
import 'package:voxa/dominio/material.dart';

abstract class AItem {
  late Material tipo;
  late IDAOMaterial dao;

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