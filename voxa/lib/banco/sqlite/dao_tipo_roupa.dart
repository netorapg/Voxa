
import 'package:voxa/dominio/dto/dto_tipo.dart';
import 'package:voxa/dominio/interface/i_dao_tipo.dart';

class DAOTipoRoupaMemoria implements IDAOTipoRoupa {
  final List<DTOTipoRoupa> _itens = [];
  int _nextId = 1;

  @override
  Future<DTOTipoRoupa> salvar(DTOTipoRoupa dto) async {
    dto.id = _nextId++;
    _itens.add(dto);
    return dto;
  }

  @override 
  Future<DTOTipoRoupa> alterar(DTOTipoRoupa dto) async {
    var index = _itens.indexWhere((item) => item.id == dto.id);
    if (index != -1) {
      _itens[index] = dto;
      return dto;
    } else {
      throw Exception('Item não encontrado');
    }
  }

  @override
  Future<bool> excluir(dynamic id) async {
    var index = _itens.indexWhere((item) => item.id == id);
    if (index != -1) {
      _itens.removeAt(index);
      return true;
    } else {
      throw Exception('Item não encontrado');
    }
  }

  @override 
  Future<List<DTOTipoRoupa>> consultar() async {
    return _itens;
  }

} 
