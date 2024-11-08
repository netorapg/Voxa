import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:voxa/banco/script.dart';

class Conexao {
  static late Database _db; // Instância do banco de dados
  static bool conexaoCriada = false; // Controle de conexão

  // Método para iniciar a conexão com o banco de dados
  static Future<Database> iniciar() async {
    // Verifica se a conexão já foi criada
    if (!conexaoCriada) {
      // Define o caminho do banco de dados
      var path = join(await getDatabasesPath(), 'voxa.db');
      
      // Abre ou cria o banco de dados
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          // Criação das tabelas
          for (var script in criarTabelas) {
            await db.execute(script);
          }
          // Inserção dos registros iniciais
          for (var registro in inserirRegistros) {
            await db.execute(registro);
          }
        },
      );
      conexaoCriada = true; // Define que a conexão foi criada
    }
    return _db; // Retorna a instância do banco de dados
  }
}
