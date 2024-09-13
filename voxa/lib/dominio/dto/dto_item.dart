import 'dart:io';

class DTOItem {
  final int  id;
  final String tipo;
  final String tamanhos;
  final String cor;
  final String marca;
  final String material;
  final int quantidadeEmEstoque;
  final String fornecedor;
  final File? imagem;
  DTOItem({
    required this.id,
    required this.tipo,
    required this.tamanhos,
    required this.cor,
    required this.marca,
    required this.material,
    required this.quantidadeEmEstoque,
    required this.fornecedor,
    required this.imagem
  });

  @override 
  bool operator == (Object other) =>
  identical(this, other) ||
  other is DTOItem &&
  runtimeType == other.runtimeType &&
  id == other.id &&
  tipo == other.tipo &&
  tamanhos == other.tamanhos &&
  cor == other.cor &&
  marca == other.marca &&
  material == other.material &&
  quantidadeEmEstoque == other.quantidadeEmEstoque &&
  fornecedor == other.fornecedor &&
  imagem == other.imagem;

  @override
  int get hashCode =>
  id.hashCode ^
  tipo.hashCode ^
  tamanhos.hashCode ^
  cor.hashCode ^
  marca.hashCode ^
  material.hashCode ^
  quantidadeEmEstoque.hashCode ^
  fornecedor.hashCode ^
  imagem.hashCode;
}