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

  Item({required this.dao});

  validar({required DTOItem dto}) {
    tipo = dto.tipo;
    tamanhos = dto.tamanhos;
    cor = dto.cor;
    marca = dto.marca;
    material = dto.material;
    quantidadeEmEstoque = dto.quantidadeEmEstoque;
    fornecedor = dto.fornecedor;
    imagem = dto.imagem;
  }

 /* Item({
    required this.id,
    required this.tipo,
    required this.tamanhos,
    required this.cor,
    required this.marca,
    required this.material,
    required this.quantidadeEmEstoque,
    required this.fornecedor,
    required this.imagem,
    required this.dao,
  }) : dto = DTOItem(
          id: id,
          tipo: tipo,
          tamanhos: tamanhos,
          cor: cor,
          marca: marca,
          material: material,
          quantidadeEmEstoque: quantidadeEmEstoque,
          fornecedor: fornecedor,
          imagem: imagem,
        );


 
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tipo': tipo,
      'tamanhos': tamanhos,
      'cor': cor,
      'marca': marca,
      'material': material,
      'quantidadeEmEstoque': quantidadeEmEstoque,
      'fornecedor': fornecedor,
      'imagem': imagem
    };
  }

  factory Item.fromMap(Map<String, dynamic> map, IDAOItem dao) {
    return Item(
      id: map['id'],
      tipo: map['tipo'],
      tamanhos: map['tamanhos'],
      cor: map['cor'],
      marca: map['marca'],
      material: map['material'],
      quantidadeEmEstoque: map['quantidadeEmEstoque'],
      fornecedor: map['fornecedor'],
      imagem: map['imagem'],
      dao: dao,  // Passando o dao no fromMap também
    );
  } */
  Future<DTOItem> salvar() async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  Future<DTOItem> alterar() async {
    this.id = id;
    await dao.alterarElementosDoItem(_id);
  }

  Future<bool> excluir() async {
    this.id = id;
    await dao.excluir(_id);
    return true;
  }

  Future<List<DTOItem>> consultar() async {
    return await dao.consultar();
  }

  String? get tipo => _tipo;
  String? get tamanhos => _tamanhos;
  String? get cor => _cor;
  String? get marca => _marca;
  String? get material => _material;
  int? get quantidadeEmEstoque => _quantidadeEmEstoque;
  String? get fornecedor => _fornecedor;
  File? get imagem => _imagem;

  set id( int id) {
    if (id == null) {
      throw Exception('ID não pode ser nulo');
    }
    if(id < 0){
      throw Exception('ID não pode ser negativo');
    }
    _id = id;
  }

  set tipo(String? tipo) {
    if (tipo == null) {
      throw Exception('Tipo não pode ser nulo');
    }
    if (tipo.isEmpty) {
      throw Exception('Tipo não pode ser vazio');
    }
    _tipo = tipo;
  }

  set tamanhos(String? tamanhos) {
    if (tamanhos == null) {
      throw Exception('Tamanhos não pode ser nulo');
    }
    if (tamanhos.isEmpty) {
      throw Exception('Tamanhos não pode ser vazio');
    }
    _tamanhos = tamanhos;
  }

  set cor(String? cor) {
    if (cor == null) {
      throw Exception('Cor não pode ser nulo');
    }
    if (cor.isEmpty) {
      throw Exception('Cor não pode ser vazio');
    }
    _cor = cor;
  }

  set marca(String? marca) {
    if (marca == null) {
      throw Exception('Marca não pode ser nulo');
    }
    if (marca.isEmpty) {
      throw Exception('Marca não pode ser vazio');
    }
    _marca = marca;
  }

  set material(String? material) {
    if (material == null) {
      throw Exception('Material não pode ser nulo');
    }
    if (material.isEmpty) {
      throw Exception('Material não pode ser vazio');
    }
    _material = material;
  }

  set quantidadeEmEstoque(int? quantidadeEmEstoque) {
    if (quantidadeEmEstoque == null) {
      throw Exception('Quantidade em estoque não pode ser nulo');
    }
    if (quantidadeEmEstoque < 0) {
      throw Exception('Quantidade em estoque não pode ser negativo');
    }
    _quantidadeEmEstoque = quantidadeEmEstoque;
  }

  set fornecedor(String? fornecedor) {
    if (fornecedor == null) {
      throw Exception('Fornecedor não pode ser nulo');
    }
    if (fornecedor.isEmpty) {
      throw Exception('Fornecedor não pode ser vazio');
    }
    _fornecedor = fornecedor;
  }

  set imagem(File? imagem) {
    if (imagem == null) {
      throw Exception('Imagem não pode ser nulo');
    }
    _imagem = imagem;
  }






}
