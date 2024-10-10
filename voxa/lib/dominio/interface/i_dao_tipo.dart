import 'package:voxa/dominio/dto/dto_tipo.dart';

abstract class IDAOTipoRoupa {
  Future<DTOTipoRoupa> salvar(DTOTipoRoupa dto);
  Future<DTOTipoRoupa> alterar(DTOTipoRoupa dto);
  Future<bool> excluir(dynamic id);
  Future<List<DTOTipoRoupa>> consultar();
}