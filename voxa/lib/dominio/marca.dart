import 'package:voxa/dominio/dto/dto_marca.dart';
import 'package:voxa/dominio/interface/i_dao_marca.dart';

class Marca {
  dynamic _id;
  String _nome; // Mude para String não nulo
  IDAOMarca dao;

  Marca({
    required this.dao,
    dynamic id,
    required String nome, // Torne o parâmetro nome obrigatório
  }) : _nome = nome {
    _id = id;
  }

  void validar(DTOMarca dto) {
    if (dto.nome.isEmpty) {
      // dto.nome não pode ser nulo aqui
      throw Exception('Nome não pode ser vazio');
    }
  }

  Future<DTOMarca> salvar() async {
    final dto = DTOMarca(
      id: _id,
      nome: _nome, // Passa _nome que não é nulo
    );
    validar(dto);
    return await dao.salvar(dto);
  }

  Future<DTOMarca> alterar() async {
    if (_id == null) throw Exception('ID não pode ser nulo para alterar');

    final dto = DTOMarca(
      id: _id,
      nome: _nome, // Passa _nome que não é nulo
    );

    validar(dto);
    return await dao.alterar(dto);
  }

  Future<bool> excluir() async {
    if (_id == null) throw Exception('ID não pode ser nulo para excluir');
    return await dao.excluir(_id);
  }

  Future<List<DTOMarca>> consultar() async {
    return await dao.consultar();
  }

  // Getters
  String get nome => _nome; // Ajusta o getter

  // Setters
  set id(dynamic id) {
    if (id == null || (id is int && id < 0)) {
      throw Exception('ID não pode ser nulo ou negativo');
    }
    _id = id;
  }

  set nome(String nome) {
    // Nome não pode ser nulo
    if (nome.isEmpty) {
      throw Exception('Nome não pode ser nulo ou vazio');
    }

    _nome = nome; // Atribui diretamente porque não é mais nulo
  }
}
