import 'package:voxa/dominio/dto/dto_tamanho.dart';
import 'package:voxa/dominio/interface/i_dao_tamanho.dart';

class TamanhoRoupa {
  dynamic _id;
  String _nome; // Mude para String não nulo
  IDAOTamanho dao;

  TamanhoRoupa({
    required this.dao,
    dynamic id,
    required String nome, // Torne o parâmetro nome obrigatório
  })  : _nome = nome {
    _id = id;
  }

  void validar(DTOTamanho dto) {
    if (dto.nome.isEmpty) { // dto.nome não pode ser nulo aqui
      throw Exception('Nome não pode ser vazio');
    }
    if (_contemSimbolos(dto.nome)) {
      throw Exception('Nome não deve conter simbolos');
    }
    if (_contemCombinacao(dto.nome)) {
      throw Exception('Nome não pode ter combinação de letras e números');
    }
  }

  Future<DTOTamanho> salvar() async {
    final dto = DTOTamanho(
      id: _id,
      nome: _nome, // Passa _nome que não é nulo
    );
    validar(dto);
    return await dao.salvar(dto);
  }

  Future<DTOTamanho> alterar() async {
    if (_id == null) throw Exception('ID não pode ser nulo para alterar');

    final dto = DTOTamanho(
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

  Future<List<DTOTamanho>> consultar() async {
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

  set nome(String nome) { // Nome não pode ser nulo
    if (nome.isEmpty) {
      throw Exception('Nome não pode ser nulo ou vazio');
    }

    if (_contemSimbolos(nome)) {
      throw Exception('Nome não deve conter simbolos');
    }

    _nome = nome; // Atribui diretamente porque não é mais nulo
  }

  bool _contemSimbolos(String nome) {
    final regex = RegExp(r'[^\w\s]');
    return regex.hasMatch(nome);
  }

  bool _contemCombinacao(String nome) {
    final letras = RegExp(r'[a-zA-Z]');
    final numeros = RegExp(r'[0-9]');
    
    return letras.hasMatch(nome) && numeros.hasMatch(nome);
  }
}
