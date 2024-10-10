import 'package:voxa/dominio/dto/dto_fornecedor.dart';
import 'package:voxa/dominio/interface/i_dao_fornecedor.dart';

class DAOFornecedorMemoria implements IDAOFornecedor {
  final List<DTOFornecedor> _fornecedores = [];

  @override
  Future<DTOFornecedor> salvar(DTOFornecedor dto) async {
    dto.id = _fornecedores.length + 1; // Simula um ID auto-incremento
    _fornecedores.add(dto);
    return dto;
  }

  @override
  Future<DTOFornecedor> alterar(DTOFornecedor dto) async {
    var index = _fornecedores.indexWhere((f) => f.id == dto.id);
    if (index == -1) throw Exception('Fornecedor não encontrado');
    _fornecedores[index] = dto;
    return dto;
  }

  @override
  Future<bool> excluir(dynamic id) async {
    var index = _fornecedores.indexWhere((f) => f.id == id);
    if (index == -1) return false;
    _fornecedores.removeAt(index);
    return true;
  }

  @override
  Future<List<DTOFornecedor>> consultar() async {
    return _fornecedores;
  }
}
