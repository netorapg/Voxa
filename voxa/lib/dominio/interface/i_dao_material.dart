import 'package:voxa/dominio/dto/dto_material.dart';

abstract class IDAOMaterial {
  Future<DTOMaterial> salvar(DTOMaterial dto);
  Future<DTOMaterial> alterar(DTOMaterial dto);
  Future<bool> excluir(dynamic id);
  Future<List<DTOMaterial>> consultar();
}
