import 'package:voxa/dominio/dto/dto_material.dart';
import 'package:voxa/dominio/interface/i_dao_material.dart';

class DAOMaterialMemoria implements IDAOMaterial {
  final List<DTOMaterial> _materiais = [];

  @override
  Future<DTOMaterial> salvar(DTOMaterial dto) async {
    dto.id = _materiais.length + 1; // Simula um ID auto-incremento
    _materiais.add(dto);
    return dto;
  }

  @override
  Future<DTOMaterial> alterar(DTOMaterial dto) async {
    var index = _materiais.indexWhere((m) => m.id == dto.id);
    if (index == -1) throw Exception('Material não encontrado');
    _materiais[index] = dto;
    return dto;
  }

  @override
  Future<bool> excluir(dynamic id) async {
    var index = _materiais.indexWhere((m) => m.id == id);
    if (index == -1) return false;
    _materiais.removeAt(index);
    return true;
  }

  @override
  Future<List<DTOMaterial>> consultar() async {
    return _materiais;
  }
}
