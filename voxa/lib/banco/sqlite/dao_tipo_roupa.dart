import 'package:voxa/dominio/dto/dto_tipo.dart';
import 'package:voxa/dominio/interface/i_dao_tipo.dart';

class DAOTipoMemoria implements IDAOTipoRoupa {
  final List<DTOTipoRoupa> _tamanhos = [];

  @override
  Future<DTOTipoRoupa> salvar(DTOTipoRoupa dto) async {
    dto.id = _tamanhos.length + 1; // Simula um ID auto-incremento
    _tamanhos.add(dto);
    return dto;
  }

  @override
  Future<DTOTipoRoupa> alterar(DTOTipoRoupa dto) async {
    var index = _tamanhos.indexWhere((t) => t.id == dto.id);
    if (index == -1) throw Exception('Tamanho não encontrado');
    _tamanhos[index] = dto;
    return dto;
  }

  @override
  Future<bool> excluir(dynamic id) async {
    var index = _tamanhos.indexWhere((t) => t.id == id);
    if (index == -1) return false;
    _tamanhos.removeAt(index);
    return true;
  }

  @override
  Future<List<DTOTipoRoupa>> consultar() async {
    return _tamanhos;
  }
}
