
import 'package:sqflite/sqflite.dart';
import 'package:voxa/banco/sqlite/conexao.dart';
import 'package:voxa/dominio/dto/dto_item.dart';
import 'package:voxa/dominio/interface/i_dao_item.dart';

class DAOItem implements IDAOItem{
  late Database _db;
  final sqlInserir =
  '''
  INSERT INTO item (tipo, tamanhos, cor, marca, material, quantidadeEmEstoque, fornecedor, imagem)
  VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  ''';
  final sqlAlterar =
  '''
  UPDATE item SET tipo = ?, tamanhos = ?, cor = ?, marca = ?, material = ?, quantidadeEmEstoque = ?, fornecedor = ?, imagem = ?
  WHERE id = ?
  ''';
  final sqlExcluir = 
  '''
  DELETE FROM item WHERE id = ?
  ''';
  final sqlConsultarPorId = 
  '''
  SELECT * FROM item WHERE id = ?
  ''';
  final sqlConsultar = 
  '''
  SELECT * FROM item
  ''';

  @override
  Future<DTOItem> salvar(DTOItem dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir, [dto.tipo, dto.tamanhos, dto.cor, dto.marca, dto.material, dto.quantidadeEmEstoque, dto.fornecedor, dto.imagem]);
    dto.id = id;
    return dto;
  }

  @override
  Future<bool> excluir(int id) async {
    _db = await Conexao.iniciar();
    int count = await _db.rawDelete(sqlExcluir, [id]);
    return count > 0;
  }