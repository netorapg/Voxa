class DTOProduto {
  int? id;
  int quantidade;
  String foto;
  String corHex;
  
  // Atributos herdados
  String fornecedor;
  String marca;
  String material;
  String tamanho;
  String tipo;

  DTOProduto({
    this.id,
    required this.quantidade,
    required this.foto,
    required this.corHex,
    required this.fornecedor,
    required this.marca,
    required this.material,
    required this.tamanho,
    required this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quantidade': quantidade,
      'foto': foto,
      'corHex': corHex,
      'fornecedor': fornecedor,
      'marca': marca,
      'material': material,
      'tamanho': tamanho,
      'tipo': tipo,
    };
  }

  static DTOProduto fromMap(Map<String, dynamic> map) {
    return DTOProduto(
      id: map['id'],
      quantidade: map['quantidade'],
      foto: map['foto'],
      corHex: map['corHex'],
      fornecedor: map['fornecedor'],
      marca: map['marca'],
      material: map['material'],
      tamanho: map['tamanho'],
      tipo: map['tipo'],
    );
  }
}
