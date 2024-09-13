import 'dart:io';
import 'package:voxa/dominio/dto/dto_item.dart';
import 'package:voxa/dominio/interface/i_dao_item.dart';

class Item {
  dynamic id;
  String tipo;
  String tamanhos;
  String cor;
  String marca;
  String material;
  int quantidadeEmEstoque;
  String fornecedor;
  File? imagem;
  DTOItem dto;
  IDAOItem dao;

  Item({
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
  }

  Future<DTOItem> incluir() async {
    return await dao.salvar(dto);
  }
}
