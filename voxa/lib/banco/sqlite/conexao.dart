import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:voxa/banco/script.dart';

class Conexao {
  static late Database _db;
  static bool conexaoCriada = false;

  static Future<Database> iniciar() async {
    if (!conexaoCriada) {
      var path = join(await getDatabasesPath(), 'voxa.db');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          for (var script in criarTabelas) {
            await db.execute(script);
          }
          for (var registro in inserirRegistros) {
            await db.execute(registro);
          }
        },
      );
      conexaoCriada = true;
    }
    return _db;
  }
}
