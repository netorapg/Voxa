
import 'package:sqflite/sqflite.dart';
import 'package:voxa/banco/sqlite/conexao.dart';
import 'package:voxa/dominio/dto/dto_item.dart';
import 'package:voxa/dominio/interface/i_dao_item.dart';

class DAOItem implements IDAOItem{
  late Database _db;
  @override
  Future<DTOItem> salvar(DTOItem dto) async {
    _db = await Conexao.get();
    int id = await _db.rawInsert('''INSERT INTO item(tipo, tamanhos, cor, marca, material, quantidadeEmEstoque, fornecedor, imagem) VALUES(?, ?, ?, ?, ?, ?, ?, ?)''', [dto.tipo, dto.tamanhos, dto.cor, dto.marca, dto.material, dto.quantidadeEmEstoque, dto.fornecedor, dto.imagem]);
    dto.id = id;
    return dto;
  }
}