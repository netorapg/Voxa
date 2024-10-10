

import 'package:voxa/dominio/dto/dto_tipo.dart';
import 'package:voxa/dominio/interface/i_dao_tipo.dart';

class TipoRoupa {
  dynamic _id;
  String? _nome;
  IDAOTipoRoupa dao;

  TipoRoupa({
    required this.dao,
    dynamic id,
    String? nome,
  }) {
    this._id = id;
    this.nome = nome;
  }

  void validar(DTOTipoRoupa dto) {
    if (dto.nome.isEmpty) {
      throw Exception('Nome não pode ser nulo ou vazio');
    }
  }

  Future<DTOTipoRoupa> salvar() async {
    final dto = DTOTipoRoupa(id: _id, nome: _nome!);
    validar(dto);
    return await dao.salvar(dto);
  }

  Future<DTOTipoRoupa> alterar() async {
    if (_id == null) throw Exception('ID não pode ser nulo para alterar');
    
    final dto = DTOTipoRoupa(id: _id, nome: _nome!);
    validar(dto);
    return await dao.alterar(dto);
  }

  Future<bool> excluir() async {
    if (_id == null) throw Exception('ID não pode ser nulo para excluir');
    return await dao.excluir(_id);
  }

  Future<List<DTOTipoRoupa>> consultar() async {
    return await dao.consultar();
  }

  // Getters
  String? get nome => _nome;

  // Setters com validação
  set nome(String? nome) {
    if (nome == null || nome.isEmpty) {
      throw Exception('Nome não pode ser nulo ou vazio');
    }
    _nome = nome;
  }

  set id(dynamic id) {
    if (id == null || (id is int && id < 0)) {
      throw Exception('ID não pode ser nulo ou negativo');
    }
    _id = id;
  }
}