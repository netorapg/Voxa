import 'dart:io';
import 'package:voxa/dominio/dto/dto_item.dart';
import 'package:voxa/dominio/interface/i_dao_item.dart';

class Item {
  late dynamic id;
  late String tipo;
  late String tamanhos;
  late String cor;
  late String marca;
  late String material;
  late int quantidadeEmEstoque;
  late String fornecedor;
  late File? imagem;
  late DTOItem dto;
  late IDAOItem dao;

  Item({
    required this.id,
    required this.tipo,
    required this.tamanhos,
    required this.cor,
    required this.marca,
    required this.material,
    required this.quantidadeEmEstoque,
    required this.fornecedor,
    required this.imagem
  }){
    id = dto.id;
    tipo = dto.tipo;
    tamanhos = dto.tamanhos;
    cor = dto.cor;
    marca = dto.marca;
    material = dto.material;
    quantidadeEmEstoque = dto.quantidadeEmEstoque;
    fornecedor = dto.fornecedor;
    imagem = dto.imagem;
    dto = DTOItem(
      id: this.id,
      tipo: this.tipo,
      tamanhos: this.tamanhos,
      cor: this.cor,
      marca: this.marca,
      material: this.material,
      quantidadeEmEstoque: this.quantidadeEmEstoque,
      fornecedor: this.fornecedor,
      imagem: this.imagem
    );
  }

  // Método para converter um Item em um Map (para banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tipo': tipo,
      'tamanhos': tamanhos,
      'cor': cor,
      'marca': marca,
      'material': material,
      'quantidadeEmEstoque' : quantidadeEmEstoque,
      'fornecedor' : fornecedor,
      'imagem' : imagem
    };
  }

  // Método para criar um Item a partir de um Map (do banco de dados)
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item( 
      id : map['id'],
      tipo : map['tipo'],
      cor : map['cor'],
      marca : map['marca'],
      material : map['material'],
      tamanhos : map['tamanhos'],
      quantidadeEmEstoque : map['quantidadeEmEstoque'],
      fornecedor : map['fornecedor'],
      imagem : map['imagem']
    );
  }

  Future<DTOItem> incluir() async {
    return await dao.salvar(dto);
  }
}