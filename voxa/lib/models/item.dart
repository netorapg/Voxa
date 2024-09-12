import 'dart:io';

class Item {
  int id;
  String tipo;
  String tamanhos;
  String cor;
  String marca;
  String material;
  int quantidadeEmEstoque;
  String fornecedor;
  File? imagem;
   
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
  });

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
}