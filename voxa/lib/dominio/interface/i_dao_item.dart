import 'package:voxa/dominio/dto/dto_item.dart';

abstract class IDAOItem{
  Future<DTOItem> salvar(DTOItem dto);
}