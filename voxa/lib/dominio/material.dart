import 'package:voxa/dominio/dto/dto_material.dart';
import 'package:voxa/dominio/interface/i_dao_material.dart';

class MaterialRoupa {
  dynamic _id;
  String? _nome;
  IDAOMaterial dao;

  MaterialRoupa({
    required this.dao,
    dynamic id,
    String? nome,
  }) {
    _id = id;
    this.nome = nome;
  }

  void validar(DTOMaterial dto) {
    // Validação do nome
    if (dto.nome == null || dto.nome!.isEmpty) {
      throw Exception('Nome não pode ser nulo ou vazio');
    }
  }

  Future<DTOMaterial> salvar() async {
    final dto = DTOMaterial(
      id: _id,
      nome: _nome,
    );
    validar(dto);
    return await dao.salvar(dto);
  }

  Future<DTOMaterial> alterar() async {
    if (_id == null) throw Exception('ID não pode ser nulo para alterar');

    final dto = DTOMaterial(
      id: _id,
      nome: _nome,
    );

    validar(dto);
    return await dao.alterar(dto);
  }

  Future<bool> excluir() async {
    if (_id == null) throw Exception('ID não pode ser nulo para excluir');
    return await dao.excluir(_id);
  }

  Future<List<DTOMaterial>> consultar() async {
    return await dao.consultar();
  }

  // Getters
  String? get nome => _nome;

  // Setters com validações
  set id(dynamic id) {
    if (id == null || (id is int && id < 0)) {
      throw Exception('ID não pode ser nulo ou negativo');
    }
    _id = id;
  }

  set nome(String? nome) {
    if (nome == null || nome.isEmpty) {
      throw Exception('Nome não pode ser nulo ou vazio');
    }
    _nome = nome;
  }
}
