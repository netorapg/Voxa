import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:voxa/banco/script.dart';

class Conexao {
  static Database? _db; // Banco de dados pode ser nulo antes da inicialização

  static Future<Database> iniciar() async {
    if (_db == null || !_db!.isOpen) { // Verifica se o banco já foi inicializado ou está fechado
      var path = join(await getDatabasesPath(), 'voxa.db');
      print('Caminho do banco de dados: $path');

      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          print('Criando tabelas...');
          for (var script in criarTabelas) {
            print('Executando script: $script');
            await db.execute(script);
          }
          print('Inserindo registros...');
          for (var registro in inserirRegistros) {
            print('Executando registro: $registro');
            await db.execute(registro);
          }
        },
      );
      print('Conexão criada com sucesso.');
    }
    return _db!;
  }

  static Future<void> fechar() async {
    if (_db != null && _db!.isOpen) {
      await _db!.close();
      print('Conexão com o banco de dados encerrada.');
    }
  }

  static Future<void> recriarBancoDeDados() async {
    var path = join(await getDatabasesPath(), 'voxa.db');
    print('Recriando banco de dados em: $path');

    // Deleta o banco de dados existente
    await deleteDatabase(path);
    print('Banco de dados deletado.');

    // Recria o banco de dados
    await iniciar();
    print('Banco de dados recriado com sucesso.');
  }

  static get() {}
}
