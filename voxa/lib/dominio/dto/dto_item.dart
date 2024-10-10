import 'dart:io';

class DTOItem {
  int? id;
  String? tipo;
  String? tamanhos;
  String? cor;
  String? marca;
  String? material;
  int? quantidadeEmEstoque;
  String? fornecedor;
  File? imagem;

  DTOItem({
    this.id,
    this.tipo,
    this.tamanhos,
    this.cor,
    this.marca,
    this.material,
    this.quantidadeEmEstoque,
    this.fornecedor,
    this.imagem,
  });
}
