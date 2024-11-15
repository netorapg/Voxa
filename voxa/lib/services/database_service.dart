import 'package:voxa/dominio/dto/dto_tamanho.dart';
import 'package:voxa/dominio/interface/i_dao_tamanho.dart';
import 'package:voxa/dominio/dto/dto_tipo.dart';
import 'package:voxa/dominio/interface/i_dao_tipo.dart';
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

class TipoRoupaDatabaseService implements IDAOTipoRoupa {
  // O construtor não precisa mais de uma dependência para interagir com o banco de dados
  TipoRoupaDatabaseService();

  @override
  Future<DTOTipoRoupa> salvar(DTOTipoRoupa dto) async {
    final db = await Conexao.iniciar(); // Usa a conexão gerenciada
    final id = await db.insert('tipos', dto.toMap());
    return DTOTipoRoupa(id: id, nome: dto.nome); // Verifica se o ID gerado é o esperado
  }

  @override
  Future<DTOTipoRoupa> alterar(DTOTipoRoupa dto) async {
    final db = await Conexao.iniciar(); // Usa a conexão gerenciada
    await db.update(
      'tipos',
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
      'tipos',
      where: 'id = ?',
      whereArgs: [id],
    );
    return rows > 0; // Retorna true se alguma linha foi deletada
  }

  @override
  Future<List<DTOTipoRoupa>> consultar() async {
    final db = await Conexao.iniciar(); // Usa a conexão gerenciada
    final List<Map<String, dynamic>> result = await db.query('tipos');
    return result.map((map) => DTOTipoRoupa.fromMap(map)).toList(); // Converte o resultado
  }
}
