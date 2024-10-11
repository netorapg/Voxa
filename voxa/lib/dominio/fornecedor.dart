import 'package:voxa/dominio/dto/dto_fornecedor.dart';
import 'package:voxa/dominio/interface/i_dao_fornecedor.dart';

class Fornecedor {
  dynamic _id;
  String? _nome;
  String? _contato;
  IDAOFornecedor dao;

  Fornecedor({
    required this.dao,
    dynamic id,
    String? nome,
    String? contato,
  }) {
    _id = id;
    this.nome = nome;
    this.contato = contato;
  }

  void validar(DTOFornecedor dto) {
    // Validação do nome
    if (dto.nome == null || dto.nome!.isEmpty) {
      throw Exception('Nome não pode ser nulo ou vazio');
    }
    // Validação do contato
    if (dto.contato == null || dto.contato!.isEmpty) {
      throw Exception('Contato não pode ser nulo ou vazio');
    }
  }

  Future<DTOFornecedor> salvar() async {
    final dto = DTOFornecedor(
      id: _id,
      nome: _nome,
      contato: _contato,
    );
    validar(dto);
    return await dao.salvar(dto);
  }

  Future<DTOFornecedor> alterar() async {
    if (_id == null) throw Exception('ID não pode ser nulo para alterar');

    final dto = DTOFornecedor(
      id: _id,
      nome: _nome,
      contato: _contato,
    );

    validar(dto);
    return await dao.alterar(dto);
  }

  Future<bool> excluir() async {
    if (_id == null) throw Exception('ID não pode ser nulo para excluir');
    return await dao.excluir(_id);
  }

  Future<List<DTOFornecedor>> consultar() async {
    return await dao.consultar();
  }

  // Getters
  String? get nome => _nome;
  String? get contato => _contato;

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

  set contato(String? contato) {
    if (contato == null || contato.isEmpty) {
      throw Exception('Contato não pode ser nulo ou vazio');
    }
    _contato = contato;
  }
}
