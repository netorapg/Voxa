import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:voxa/banco/sqlite/conexao.dart';
import 'package:voxa/dominio/dto/dto_item.dart';
import 'package:voxa/dominio/interface/i_dao_item.dart';

class DAOItem implements IDAOItem {
  late Database _db;

  final String sqlInserir = '''
    INSERT INTO item (tipo, tamanhos, cor, marca, material, quantidadeEmEstoque, fornecedor, imagem)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  ''';

  final String sqlAlterar = '''
    UPDATE item SET tipo = ?, tamanhos = ?, cor = ?, marca = ?, material = ?, quantidadeEmEstoque = ?, fornecedor = ?, imagem = ?
    WHERE id = ?
  ''';

  final String sqlExcluir = '''
    DELETE FROM item WHERE id = ?
  ''';

  final String sqlConsultarPorId = '''
    SELECT * FROM item WHERE id = ?
  ''';

  final String sqlConsultar = '''
    SELECT * FROM item
  ''';

  @override
  Future<DTOItem> salvar(DTOItem dto) async {
    _db = await Conexao.iniciar();
    
    // Verifica se a imagem não é nula e obtém o caminho
    String? imagemCaminho = dto.imagem?.path;
    
    int id = await _db.rawInsert(
      sqlInserir, 
      [dto.tipo, dto.tamanhos, dto.cor, dto.marca, dto.material, dto.quantidadeEmEstoque, dto.fornecedor, imagemCaminho]
    );
    
    dto.id = id; // Atualiza o DTO com o ID gerado pelo banco de dados
    return dto;
  }

  @override
  Future<bool> excluir(int id) async {
    _db = await Conexao.iniciar();
    int count = await _db.rawDelete(sqlExcluir, [id]);
    return count > 0;
  }

  @override
  Future<DTOItem> alterar(DTOItem dto) async {
    _db = await Conexao.iniciar();
    
    String? imagemCaminho = dto.imagem?.path;
    
    int count = await _db.rawUpdate(
      sqlAlterar,
      [dto.tipo, dto.tamanhos, dto.cor, dto.marca, dto.material, dto.quantidadeEmEstoque, dto.fornecedor, imagemCaminho, dto.id]
    );
    
    if (count > 0) {
      return dto; // Retorna o DTO atualizado se a alteração for bem-sucedida
    } else {
      throw Exception('Erro ao atualizar item.');
    }
  }

  @override
  Future<DTOItem> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    List<Map<String, dynamic>> resultado = await _db.rawQuery(sqlConsultarPorId, [id]);

    if (resultado.isNotEmpty) {
      var item = resultado.first;
      return DTOItem(
        id: item['id'],
        tipo: item['tipo'],
        tamanhos: item['tamanhos'],
        cor: item['cor'],
        marca: item['marca'],
        material: item['material'],
        quantidadeEmEstoque: item['quantidadeEmEstoque'],
        fornecedor: item['fornecedor'],
        imagem: item['imagem'] != null ? File(item['imagem']) : null, // Converte caminho para File
      );
    } else {
      throw Exception('Item não encontrado.');
    }
  }

  @override
  Future<List<DTOItem>> consultar() async {
    _db = await Conexao.iniciar();
    List<Map<String, dynamic>> resultado = await _db.rawQuery(sqlConsultar);

    return resultado.map((item) {
      return DTOItem(
        id: item['id'],
        tipo: item['tipo'],
        tamanhos: item['tamanhos'],
        cor: item['cor'],
        marca: item['marca'],
        material: item['material'],
        quantidadeEmEstoque: item['quantidadeEmEstoque'],
        fornecedor: item['fornecedor'],
        imagem: item['imagem'] != null ? File(item['imagem']) : null,
      );
    }).toList();
  }
}
