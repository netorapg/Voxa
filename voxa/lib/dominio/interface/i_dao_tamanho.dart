import 'package:voxa/dominio/dto/dto_tamanho.dart';

abstract class IDAOTamanho {
  Future<DTOTamanho> salvar(DTOTamanho dto);
  Future<DTOTamanho> alterar(DTOTamanho dto);
  Future<bool> excluir(dynamic id);
  Future<List<DTOTamanho>> consultar();
}
