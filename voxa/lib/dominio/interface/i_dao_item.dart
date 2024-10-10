import 'package:voxa/dominio/dto/dto_item.dart';

abstract class IDAOItem {
  Future<DTOItem> salvar(DTOItem dto);
  Future<DTOItem> alterar(DTOItem dto);
  Future<bool> excluir(int id);
  Future<DTOItem> consultarPorId(int id);
  Future<List<DTOItem>> consultar();
}
