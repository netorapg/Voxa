import 'package:voxa/dominio/interface/i_dao_tamanho.dart';
import 'package:voxa/dominio/dto/dto_tamanho.dart';

class DefaultDaoTamanho implements IDAOTamanho {
  @override
  Future<DTOTamanho> salvar(DTOTamanho dto) async {
    return dto; // Mock implementation
  }

  @override
  Future<DTOTamanho> alterar(DTOTamanho dto) async {
    return dto; // Mock implementation
  }

  @override
  Future<bool> excluir(dynamic id) async {
    return true; // Mock implementation
  }

  @override
  Future<List<DTOTamanho>> consultar() async {
    return []; // Mock implementation
  }
}
