import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Conexao {
  static Database? _database;

  static Future<Database> iniciar() async {
    if (_database != null) return _database!;

    // Caminho do banco de dados
    final path = join(await getDatabasesPath(), 'voxa.db');

    // Abrindo o banco de dados
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Criação das tabelas
        final tabelas = [
          '''
          CREATE TABLE tamanhos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL
          )
          ''',
          '''
          CREATE TABLE tipos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL
          )
          ''',
          '''
          CREATE TABLE materiais (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL
          )
          ''',
          '''
          CREATE TABLE marcas (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL
          )
          '''
        ];

        for (var tabela in tabelas) {
          await db.execute(tabela);
        }

        // Inserção de registros iniciais
        await db.execute('''
          INSERT INTO tamanhos (nome) VALUES
          ('P'), ('M'), ('G'), ('GG'), ('XGG'), ('48');
        ''');

        await db.execute('''
          INSERT INTO tipos (nome) VALUES
          ('Camiseta'), ('Calça'), ('Bermuda'), ('Blusa'), ('Vestido');
        ''');

        await db.execute('''
          INSERT INTO materiais (nome) VALUES
          ('Algodão'), ('Poliéster'), ('Lã'), ('Seda'), ('Jeans');
        ''');

        await db.execute('''
          INSERT INTO marcas (nome) VALUES
          ('Marisa'), ('Renner'), ('C&A'), ('Zara'), ('Hering');
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Lógica de migração caso a versão do banco seja alterada
      },
    );

    return _database!;
  }

  static Future<void> fechar() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
