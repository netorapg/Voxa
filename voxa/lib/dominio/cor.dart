import 'package:voxa/dominio/dto/dto_cor.dart';
import 'package:voxa/dominio/interface/i_dao_cor.dart';

class CorRoupa {
  dynamic _id;
  String _nome;
  String _corHex;
  IDAOCor dao;

  CorRoupa({
    required this.dao,
    dynamic id,
    required String nome,
    required String corHex,
  }) : _nome = nome,
        _corHex = corHex {
    _id = id;
  }

  void validar(DTOCor dto) {
    // Validação do nome
    if (dto.nome.isEmpty) {
      throw Exception('Nome não pode ser vazio');
    }
  }

  Future<DTOCor> salvar() async {
    final dto = DTOCor(
      id: _id,
      nome: _nome,
      corHex: _corHex,
    );
    validar(dto);
    return await dao.salvar(dto);
  }

  Future<DTOCor> alterar() async {
    if (_id == null) throw Exception('ID não pode ser nulo para alterar');

    final dto = DTOCor(
      id: _id,
      nome: _nome,
      corHex: _corHex,
    );

    validar(dto);
    return await dao.alterar(dto);
  }

  Future<bool> excluir() async {
    if (_id == null) throw Exception('ID não pode ser nulo para excluir');
    return await dao.excluir(_id);
  }

  Future<List<DTOCor>> consultar() async {
    return await dao.consultar();
  }

  // Getters
  String? get nome => _nome;
  String? get corHex => _corHex;

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

  set corHex(String? corHex) {
    if (corHex == null || corHex.isEmpty) {
      throw Exception('Cor não pode ser nula ou vazia');
    }
    final hexRegExp = RegExp(r'^[0-9A-Fa-f]{6}$');
    if (!hexRegExp.hasMatch(corHex)) {
      throw Exception('Cor deve ser um código hexadecimal válido (exemplo: "FFFFFF")');
    }
    _corHex = corHex;
  }
}
