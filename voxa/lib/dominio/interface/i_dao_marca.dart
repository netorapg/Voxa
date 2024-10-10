import 'package:voxa/dominio/dto/dto_marca.dart';

abstract class IDAOMarca {
  Future<DTOMarca> salvar(DTOMarca dto);
  Future<DTOMarca> alterar(DTOMarca dto);
  Future<bool> excluir(dynamic id);
  Future<List<DTOMarca>> consultar();
}
