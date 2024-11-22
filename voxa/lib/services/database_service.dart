import 'package:voxa/dominio/dto/dto_marca.dart';
import 'package:voxa/dominio/dto/dto_material.dart';
import 'package:voxa/dominio/dto/dto_tamanho.dart';
import 'package:voxa/dominio/interface/i_dao_marca.dart';
import 'package:voxa/dominio/interface/i_dao_material.dart';
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


class MaterialDatabaseService implements IDAOMaterial {
  // O construtor não precisa mais de uma dependência para interagir com o banco de dados
  MaterialDatabaseService();

  @override
  Future<DTOMaterial> salvar(DTOMaterial dto) async {
    final db = await Conexao.iniciar(); // Usa a conexão gerenciada
    final id = await db.insert('materiais', dto.toMap());
    return DTOMaterial(id: id, nome: dto.nome); // Verifica se o ID gerado é o esperado
  }

  @override
  Future<DTOMaterial> alterar(DTOMaterial dto) async {
    final db = await Conexao.iniciar(); // Usa a conexão gerenciada
    await db.update(
      'materiais',
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
      'materiais',
      where: 'id = ?',
      whereArgs: [id],
    );
    return rows > 0; // Retorna true se alguma linha foi deletada
  }

  @override
  Future<List<DTOMaterial>> consultar() async {
    final db = await Conexao.iniciar(); // Usa a conexão gerenciada
    final List<Map<String, dynamic>> result = await db.query('materiais');
    return result.map((map) => DTOMaterial.fromMap(map)).toList(); // Converte o resultado
  }

}



class MarcaDatabaseService implements IDAOMarca {
  // O construtor não precisa mais de uma dependência para interagir com o banco de dados
  MarcaDatabaseService();

  @override
  Future<DTOMarca> salvar(DTOMarca dto) async {
    final db = await Conexao.iniciar(); // Usa a conexão gerenciada
    final id = await db.insert('marcas', dto.toMap());
    return DTOMarca(id: id, nome: dto.nome); // Verifica se o ID gerado é o esperado
  }

  @override
  Future<DTOMarca> alterar(DTOMarca dto) async {
    final db = await Conexao.iniciar(); // Usa a conexão gerenciada
    await db.update(
      'marcas',
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
      'marcas',
      where: 'id = ?',
      whereArgs: [id],
    );
    return rows > 0; // Retorna true se alguma linha foi deletada
  }

  @override
  Future<List<DTOMarca>> consultar() async {
    final db = await Conexao.iniciar(); // Usa a conexão gerenciada
    final List<Map<String, dynamic>> result = await db.query('marcas');
    return result.map((map) => DTOMarca.fromMap(map)).toList(); // Converte o resultado
  }

}





