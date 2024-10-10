import 'package:voxa/dominio/dto/dto_cor.dart';

abstract class IDAOCor {
  Future<DTOCor> salvar(DTOCor dto);
  Future<DTOCor> alterar(DTOCor dto);
  Future<bool> excluir(dynamic id);
  Future<List<DTOCor>> consultar();
}
