
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:voxa/banco/sqlite/conexao.dart';


main() {
  late Database db;
  setUpAll(() async {
    databaseFactory = databaseFactoryFfi;
    sqfliteFfiInit();
    db = await Conexao.get();
  });
  test('test script create table', () async {
    var list = await db.rawQuery('SELECT * FROM item');
    expect(list.length, 3);
  });
}