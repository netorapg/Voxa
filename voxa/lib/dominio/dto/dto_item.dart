class DTOItem {
  dynamic  id;
  final String tipo;
  final String tamanhos;
  final String cor;
  final String marca;
  final String material;
  final int quantidadeEmEstoque;
  final String fornecedor;
  final dynamic imagem;
  DTOItem({
    this.id,
    required this.tipo,
    required this.tamanhos,
    required this.cor,
    required this.marca,
    required this.material,
    required this.quantidadeEmEstoque,
    required this.fornecedor,
    required this.imagem
  });
}