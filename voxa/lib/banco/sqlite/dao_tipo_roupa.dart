import 'package:voxa/dominio/dto/dto_tipo.dart';
import 'package:voxa/dominio/interface/i_dao_tipo.dart';

class DAOTipoMemoria implements IDAOTipoRoupa {
  final List<DTOTipoRoupa> _tipos = [];
  int _idCounter = 0; // Para simular IDs únicos

  @override
  Future<DTOTipoRoupa> salvar(DTOTipoRoupa dto) async {
    _idCounter++;
    dto.id = _idCounter; // Atribui um ID único
    _tipos.add(dto);
    return dto;
  }

  @override
  Future<DTOTipoRoupa> alterar(DTOTipoRoupa dto) async {
    var index = _tipos.indexWhere((t) => t.id == dto.id);
    if (index == -1) throw Exception('Tipo não encontrado');
    _tipos[index] = dto;
    return dto;
  }

  @override
  Future<bool> excluir(dynamic id) async {
    var index = _tipos.indexWhere((t) => t.id == id);
    if (index == -1) return false;
    _tipos.removeAt(index);
    return true;
  }

  @override
  Future<List<DTOTipoRoupa>> consultar() async {
    return _tipos;
  }
}
