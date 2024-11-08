import 'package:voxa/dominio/dto/dto_tamanho.dart';
import 'package:voxa/dominio/interface/i_dao_tamanho.dart';
import 'package:voxa/dominio/dto/dto_cor.dart';
import 'package:voxa/dominio/interface/i_dao_cor.dart';
import 'package:voxa/banco/sqlite/conexao.dart'; // Importa a classe de conexão

class TamanhoRoupaDatabaseService implements IDAOTamanho {
  // O construtor não precisa mais de uma dependência para interagir com o banco de dados
  TamanhoRoupaDatabaseService();

  @override
  Future<DTOTamanho> salvar(DTOTamanho dto) async {
    final db = await Conexao.iniciar(); // Usa a conexão gerenciada
    final id = await db.insert('tamanhos', dto.toMap());
    return DTOTamanho(id: id, nome: dto.nome); // Verifica se o ID gerado é o esperado
  }

  @override
  Future<DTOTamanho> alterar(DTOTamanho dto) async {
    final db = await Conexao.iniciar(); // Usa a conexão gerenciada
    await db.update(
      'tamanhos',
      dto.toMap(),
      where: 'id = ?',
      whereArgs: [dto.id],
    );
    return dto;
  }

  @override
  Future<bool> excluir(dynamic id) async {
    final db = await Conexao.iniciar(); // Usa a conexão gerenciada
    final rows = await db.delete(
      'tamanhos',
      where: 'id = ?',
      whereArgs: [id],
    );
    return rows > 0; // Retorna true se alguma linha foi deletada
  }

  @override
  Future<List<DTOTamanho>> consultar() async {
    final db = await Conexao.iniciar(); // Usa a conexão gerenciada
    final List<Map<String, dynamic>> result = await db.query('tamanhos');
    return result.map((map) => DTOTamanho.fromMap(map)).toList(); // Converte o resultado
  }
}


class CorDatabaseService implements IDAOCor {
  // Construtor da classe
  CorDatabaseService();

  @override
  Future<DTOCor> salvar(DTOCor dto) async {
    final db = await Conexao.iniciar(); // Inicia a conexão com o banco
    final id = await db.insert('cores', dto.toMap());
    return DTOCor(id: id, nome: dto.nome); // Retorna o DTO com o novo ID gerado
  }

  @override
  Future<DTOCor> alterar(DTOCor dto) async {
    final db = await Conexao.iniciar(); // Inicia a conexão com o banco
    await db.update(
      'cores',
      dto.toMap(),
      where: 'id = ?',
      whereArgs: [dto.id],
    );
    return dto;
  }

  @override
  Future<bool> excluir(dynamic id) async {
    final db = await Conexao.iniciar(); // Inicia a conexão com o banco
    final rows = await db.delete(
      'cores',
      where: 'id = ?',
      whereArgs: [id],
    );
    return rows > 0; // Retorna true se uma ou mais linhas foram deletadas
  }

  @override
  Future<List<DTOCor>> consultar() async {
    final db = await Conexao.iniciar(); // Inicia a conexão com o banco
    final List<Map<String, dynamic>> result = await db.query('cores');
    return result.map((map) => DTOCor.fromMap(map)).toList(); // Converte o resultado em uma lista de DTOCor
  }
}