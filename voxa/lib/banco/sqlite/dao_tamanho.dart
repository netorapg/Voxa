import 'package:voxa/dominio/dto/dto_tamanho.dart';
import 'package:voxa/dominio/interface/i_dao_tamanho.dart';

class DAOTamanhoMemoria implements IDAOTamanho {
  final List<DTOTamanho> _tamanhos = [];

  @override
  Future<DTOTamanho> salvar(DTOTamanho dto) async {
    dto.id = _tamanhos.length + 1; // Simula um ID auto-incremento
    _tamanhos.add(dto);
    return dto;
  }

  @override
  Future<DTOTamanho> alterar(DTOTamanho dto) async {
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
  Future<List<DTOTamanho>> consultar() async {
    return _tamanhos;
  }
}
