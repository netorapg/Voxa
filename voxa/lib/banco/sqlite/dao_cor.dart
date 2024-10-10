import 'package:voxa/dominio/dto/dto_cor.dart';
import 'package:voxa/dominio/interface/i_dao_cor.dart';

class DAOCorMemoria implements IDAOCor {
  final List<DTOCor> _cores = [];

  @override
  Future<DTOCor> salvar(DTOCor dto) async {
    dto.id = _cores.length + 1; // Simula um ID auto-incremento
    _cores.add(dto);
    return dto;
  }

  @override
  Future<DTOCor> alterar(DTOCor dto) async {
    var index = _cores.indexWhere((c) => c.id == dto.id);
    if (index == -1) throw Exception('Cor não encontrada');
    _cores[index] = dto;
    return dto;
  }

  @override
  Future<bool> excluir(dynamic id) async {
    var index = _cores.indexWhere((c) => c.id == id);
    if (index == -1) return false;
    _cores.removeAt(index);
    return true;
  }

  @override
  Future<List<DTOCor>> consultar() async {
    return _cores;
  }
}
