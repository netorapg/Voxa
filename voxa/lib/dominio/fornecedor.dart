import 'package:voxa/dominio/dto/dto_fornecedor.dart';
import 'package:voxa/dominio/interface/i_dao_fornecedor.dart';

class Fornecedor {
  dynamic _id;
  String? _razaoSocial;
  String? _nomeFantasia;
  String? _cnpj;
  String? _endereco;
  String? _telefone;
  String? _email;
  IDAOFornecedor dao;

  Fornecedor({
    required this.dao,
    dynamic id,
    String? razaoSocial,
    String? nomeFantasia,
    String? cnpj,
    String? endereco,
    String? telefone,
    String? email,
  }) {
    _id = id;
    this.razaoSocial = razaoSocial;
    this.nomeFantasia = nomeFantasia;
    this.cnpj = cnpj;
    this.endereco = endereco;
    this.telefone = telefone;
    this.email = email;
  }

  void validar(DTOFornecedor dto) {
    if (dto.razaoSocial == null || dto.razaoSocial!.isEmpty) {
      throw Exception('Razão Social não pode ser nula ou vazia');
    }
    if (dto.cnpj == null || dto.cnpj!.isEmpty) {
      throw Exception('CNPJ não pode ser nulo ou vazio');
    }
    if (dto.telefone == null || dto.telefone!.isEmpty) {
      throw Exception('Telefone não pode ser nulo ou vazio');
    }
    if (dto.email == null || dto.email!.isEmpty) {
      throw Exception('Email não pode ser nulo ou vazio');
    }
  }

  Future<DTOFornecedor> salvar() async {
    final dto = DTOFornecedor(
      id: _id,
      razaoSocial: _razaoSocial,
      nomeFantasia: _nomeFantasia,
      cnpj: _cnpj,
      endereco: _endereco,
      telefone: _telefone,
      email: _email,
    );
    validar(dto);
    return await dao.salvar(dto);
  }

  Future<DTOFornecedor> alterar() async {
    if (_id == null) throw Exception('ID não pode ser nulo para alterar');

    final dto = DTOFornecedor(
      id: _id,
      razaoSocial: _razaoSocial,
      nomeFantasia: _nomeFantasia,
      cnpj: _cnpj,
      endereco: _endereco,
      telefone: _telefone,
      email: _email,
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
  String? get razaoSocial => _razaoSocial;
  String? get nomeFantasia => _nomeFantasia;
  String? get cnpj => _cnpj;
  String? get endereco => _endereco;
  String? get telefone => _telefone;
  String? get email => _email;

  // Setters com validações
  set id(dynamic id) {
    if (id == null || (id is int && id < 0)) {
      throw Exception('ID não pode ser nulo ou negativo');
    }
    _id = id;
  }

  set razaoSocial(String? razaoSocial) {
    if (razaoSocial == null || razaoSocial.isEmpty) {
      throw Exception('Razão Social não pode ser nula ou vazia');
    }
    _razaoSocial = razaoSocial;
  }

  set nomeFantasia(String? nomeFantasia) {
    _nomeFantasia = nomeFantasia;
  }

  set cnpj(String? cnpj) {
    if (cnpj == null || cnpj.isEmpty) {
      throw Exception('CNPJ não pode ser nulo ou vazio');
    }
    _cnpj = cnpj;
  }

  set endereco(String? endereco) {
    _endereco = endereco;
  }

  set telefone(String? telefone) {
    if (telefone == null || telefone.isEmpty) {
      throw Exception('Telefone não pode ser nulo ou vazio');
    }
    _telefone = telefone;
  }

  set email(String? email) {
    if (email == null || email.isEmpty) {
      throw Exception('Email não pode ser nulo ou vazio');
    }
    _email = email;
  }
}
