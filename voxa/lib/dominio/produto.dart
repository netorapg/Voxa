
import 'package:voxa/dominio/dto/dto_produto.dart';
import 'package:voxa/dominio/interface/i_dao_produto.dart';

class Produto {
  int? _id;
  int quantidade;
  String foto;
  String corHex;
  String fornecedor;
  String marca;
  String material;
  String tamanho;
  String tipo;
  
  IProdutoDAO dao;

  Produto({
    required this.dao,
    int? id,
    required this.quantidade,
    required this.foto,
    required this.corHex,
    required this.fornecedor,
    required this.marca,
    required this.material,
    required this.tamanho,
    required this.tipo,
  }) : _id = id;

  Future<DTOProduto> salvar() async {
    final dto = DTOProduto(
      id: _id,
      quantidade: quantidade,
      foto: foto,
      corHex: corHex,
      fornecedor: fornecedor,
      marca: marca,
      material: material,
      tamanho: tamanho,
      tipo: tipo,
    );
    return await dao.salvar(dto);
  }

  Future<DTOProduto> alterar() async {
    if (_id == null) throw Exception('ID não pode ser nulo para alterar');
    final dto = DTOProduto(
      id: _id,
      quantidade: quantidade,
      foto: foto,
      corHex: corHex,
      fornecedor: fornecedor,
      marca: marca,
      material: material,
      tamanho: tamanho,
      tipo: tipo,
    );
    return await dao.alterar(dto);
  }

  Future<bool> excluir() async {
    if (_id == null) throw Exception('ID não pode ser nulo para excluir');
    return await dao.excluir(_id!);
  }

  Future<List<DTOProduto>> consultar() async {
    return await dao.consultar();
  }
}
