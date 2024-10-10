import 'dart:io';
import 'package:voxa/dominio/dto/dto_item.dart';
import 'package:voxa/dominio/interface/i_dao_item.dart';

class Item {
  dynamic _id;
  String? _tipo;
  String? _tamanhos;
  String? _cor;
  String? _marca;
  String? _material;
  int? _quantidadeEmEstoque;
  String? _fornecedor;
  File? _imagem;
  IDAOItem dao;

  Item({
    required this.dao,
    dynamic id,
    String? tipo,
    String? tamanhos,
    String? cor,
    String? marca,
    String? material,
    int? quantidadeEmEstoque,
    String? fornecedor,
    File? imagem,
  }) {
    this._id = id;
    this.tipo = tipo;
    this.tamanhos = tamanhos;
    this.cor = cor;
    this.marca = marca;
    this.material = material;
    this.quantidadeEmEstoque = quantidadeEmEstoque;
    this.fornecedor = fornecedor;
    this.imagem = imagem;
  }

void validar(DTOItem dto, {List<DTOItem> itensExistentes = const []}) {
  // Validação do tipo
  if (dto.tipo == null || dto.tipo!.isEmpty) {
    throw Exception('Tipo não pode ser nulo ou vazio');
  }
  
  // Validação dos tamanhos
  if (dto.tamanhos == null || dto.tamanhos!.isEmpty) {
    throw Exception('Tamanhos não podem ser nulos ou vazios');
  }
  
  // Verifica se tamanhos são válidos (letras ou numéricos)
  if (!RegExp(r'^[A-Za-z0-9, ]+$').hasMatch(dto.tamanhos!)) {
    throw Exception('Tamanhos devem ser letras ou números separados por vírgula');
  }

  // Validação da cor
  if (dto.cor == null || dto.cor!.isEmpty) {
    throw Exception('Cor não pode ser nula ou vazia');
  }

  // Validação da marca
  if (dto.marca == null || dto.marca!.isEmpty) {
    throw Exception('Marca não pode ser nula ou vazia');
  }

  // Validação do material
  if (dto.material == null || dto.material!.isEmpty) {
    throw Exception('Material não pode ser nulo ou vazio');
  }

  // Validação da quantidade em estoque
  if (dto.quantidadeEmEstoque == null || 
      dto.quantidadeEmEstoque! < 0 || 
      dto.quantidadeEmEstoque is! int) {
    throw Exception('Quantidade em estoque deve ser um número inteiro não negativo');
  }
  
  // Validação do fornecedor
  if (dto.fornecedor == null || dto.fornecedor!.isEmpty) {
    throw Exception('Fornecedor não pode ser nulo ou vazio');
  }

  // Validação da imagem
  if (dto.imagem == null) {
    throw Exception('Imagem não pode ser nula');
  }

  // Impedir cadastro de peças duplicadas
  for (var item in itensExistentes) {
    if (item.tipo == dto.tipo &&
        item.tamanhos == dto.tamanhos &&
        item.cor == dto.cor &&
        item.marca == dto.marca &&
        item.material == dto.material) {
      throw Exception('A peça já está cadastrada no sistema com as mesmas características.');
    }
  }
}



  Future<DTOItem> salvar() async {
    final dto = DTOItem(
      id: _id,
      tipo: _tipo,
      tamanhos: _tamanhos,
      cor: _cor,
      marca: _marca,
      material: _material,
      quantidadeEmEstoque: _quantidadeEmEstoque,
      fornecedor: _fornecedor,
      imagem: _imagem,
    );
    validar(dto);
    return await dao.salvar(dto);
  }

  Future<DTOItem> alterar() async {
    if (_id == null) throw Exception('ID não pode ser nulo para alterar');
    
    final dto = DTOItem(
      id: _id,
      tipo: _tipo,
      tamanhos: _tamanhos,
      cor: _cor,
      marca: _marca,
      material: _material,
      quantidadeEmEstoque: _quantidadeEmEstoque,
      fornecedor: _fornecedor,
      imagem: _imagem,
    );
    
    validar(dto);
    return await dao.alterar(dto);
  }

  Future<bool> excluir() async {
    if (_id == null) throw Exception('ID não pode ser nulo para excluir');
    return await dao.excluir(_id);
  }

  Future<List<DTOItem>> consultar() async {
    return await dao.consultar();
  }

  // Getters
  String? get tipo => _tipo;
  String? get tamanhos => _tamanhos;
  String? get cor => _cor;
  String? get marca => _marca;
  String? get material => _material;
  int? get quantidadeEmEstoque => _quantidadeEmEstoque;
  String? get fornecedor => _fornecedor;
  File? get imagem => _imagem;

  // Setters com validações
  set id(dynamic id) {
    if (id == null || (id is int && id < 0)) {
      throw Exception('ID não pode ser nulo ou negativo');
    }
    _id = id;
  }

  set tipo(String? tipo) {
    if (tipo == null || tipo.isEmpty) {
      throw Exception('Tipo não pode ser nulo ou vazio');
    }
    _tipo = tipo;
  }

  set tamanhos(String? tamanhos) {
    if (tamanhos == null || tamanhos.isEmpty) {
      throw Exception('Tamanhos não pode ser nulo ou vazio');
    }
    _tamanhos = tamanhos;
  }

  set cor(String? cor) {
    if (cor == null || cor.isEmpty) {
      throw Exception('Cor não pode ser nula ou vazia');
    }
    _cor = cor;
  }

  set marca(String? marca) {
    if (marca == null || marca.isEmpty) {
      throw Exception('Marca não pode ser nula ou vazia');
    }
    _marca = marca;
  }

  set material(String? material) {
    if (material == null || material.isEmpty) {
      throw Exception('Material não pode ser nulo ou vazio');
    }
    _material = material;
  }

  set quantidadeEmEstoque(int? quantidadeEmEstoque) {
    if (quantidadeEmEstoque == null || quantidadeEmEstoque < 0) {
      throw Exception('Quantidade em estoque não pode ser nula ou negativa');
    }
    _quantidadeEmEstoque = quantidadeEmEstoque;
  }

  set fornecedor(String? fornecedor) {
    if (fornecedor == null || fornecedor.isEmpty) {
      throw Exception('Fornecedor não pode ser nulo ou vazio');
    }
    _fornecedor = fornecedor;
  }

  set imagem(File? imagem) {
    if (imagem == null) {
      throw Exception('Imagem não pode ser nula');
    }
    _imagem = imagem;
  }
}
