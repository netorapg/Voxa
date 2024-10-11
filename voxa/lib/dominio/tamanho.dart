import 'package:voxa/dominio/dto/dto_tamanho.dart';
import 'package:voxa/dominio/interface/i_dao_tamanho.dart';

class TamanhoRoupa {
  dynamic _id;
  String? _nome;
  IDAOTamanho dao;

  TamanhoRoupa({
    required this.dao,
    dynamic id,
    String? nome,
  }) {
    _id = id;
    this.nome = nome;
  }

  void validar(DTOTamanho dto) {
    if (dto.nome == null) {
      throw Exception('Nome não pode ser nulo');
    }
    if (dto.nome!.isEmpty) {
      throw Exception('Nome não pode ser vazio');
    }
    if (_contemSimbolos(dto.nome!)) {
      throw Exception('Nome deve conter apenas letras ou apenas números, sem símbolos ou combinações');
    }
    if (_contemCombinacao(dto.nome!)) {
      throw Exception('Nome não pode ter combinação de letras e numeros');
    }
  }

  Future<DTOTamanho> salvar() async {
    final dto = DTOTamanho(
      id: _id,
      nome: _nome,
    );
    validar(dto);
    return await dao.salvar(dto);
  }

  Future<DTOTamanho> alterar() async {
    if (_id == null) throw Exception('ID não pode ser nulo para alterar');

    final dto = DTOTamanho(
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

  Future<List<DTOTamanho>> consultar() async {
    return await dao.consultar();
  }

  // Getters
  String? get nome => _nome;

  // Setters
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
    
    // Usando _contemSimbolos para validar o nome
    if (_contemSimbolos(nome)) {
      throw Exception('Nome deve conter apenas letras ou apenas números, sem símbolos ou combinações');
    }

    _nome = nome;
  }

  bool _contemSimbolos(String nome) {
    final regex = RegExp(r'[^\w\s]'); // Verifica se contém símbolos
    return regex.hasMatch(nome);
  }

  bool _contemCombinacao(String nome) {
    final regex = RegExp(r'^[a-zA-Z]+$'r'^[0-9]+$');
    return regex.hasMatch(nome);
  }
}
