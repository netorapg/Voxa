import 'package:voxa/dominio/dto/dto_marca.dart';
import 'package:voxa/dominio/interface/i_dao_marca.dart';

class DAOMarcaMemoria implements IDAOMarca {
  final List<DTOMarca> _marcas = [];

  @override
  Future<DTOMarca> salvar(DTOMarca dto) async {
    dto.id = _marcas.length + 1; // Simula um ID auto-incremento
    _marcas.add(dto);
    return dto;
  }

  @override
  Future<DTOMarca> alterar(DTOMarca dto) async {
    var index = _marcas.indexWhere((m) => m.id == dto.id);
    if (index == -1) throw Exception('Marca não encontrada');
    _marcas[index] = dto;
    return dto;
  }

  @override
  Future<bool> excluir(dynamic id) async {
    var index = _marcas.indexWhere((m) => m.id == id);
    if (index == -1) return false;
    _marcas.removeAt(index);
    return true;
  }

  @override
  Future<List<DTOMarca>> consultar() async {
    return _marcas;
  }
}
