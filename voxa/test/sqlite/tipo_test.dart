
import 'package:flutter_test/flutter_test.dart';
import 'package:voxa/banco/sqlite/dao_tipo_roupa.dart';
import 'package:voxa/dominio/tipo.dart';

void main() {
group('DAOTipoRoupaMemoria', () {
  late DAOTipoRoupaMemoria dao;

  setUp(() {
    dao = DAOTipoRoupaMemoria();
  });

  test('Deve salvar um tipo de roupa', () async {
    final tipoRoupa = TipoRoupa(dao: dao, nome: 'Camiseta');
    final dto = await tipoRoupa.salvar();

    expect(dto.nome, equals('Camiseta'));
    expect(dto.id, isNotNull);
  });

  test('Deve listar tipos de roupas', () async {
    final tipoRoupa1 = TipoRoupa(dao: dao, nome: "Camiseta");
    await tipoRoupa1.salvar();
    final tipoRoupa2 = TipoRoupa(dao: dao, nome: "Calça");
    await tipoRoupa2.salvar();

    final lista = await dao.consultar();
    expect(lista.length, equals(2));
    expect(lista[0].nome, equals("Camiseta"));
    expect(lista[1].nome, equals("Calça"));
  });

  test("Deve alterar um tipo de roupa", () async {
    final tipoRoupa = TipoRoupa(dao: dao, nome: "Camiseta");
    final dto = await tipoRoupa.salvar();
    tipoRoupa.nome = "Camiseta Manga Longa";
    final atualizado = await tipoRoupa.alterar();
    expect(atualizado.nome, equals("Camiseta Manga Longa"));
  });

  test("Deve excluir um tipo de roupa", () async {
  final tipoRoupa = TipoRoupa(dao: dao, nome: "Camiseta");
  await tipoRoupa.salvar();

  final resultado = await tipoRoupa.excluir();
  expect(resultado, isTrue);
  });

  test("Deve lançar exceção ao tentar alterar excluir sem ID", () async {
    final tipoRoupa = TipoRoupa(dao: dao, nome: "Camiseta");
    expect(() => tipoRoupa.alterar(), throwsException);
  });

  test("Deve lançar exceção ao tentar excluir sem ID", () async {
    final tipoRoupa = TipoRoupa(dao:dao, nome: "Camiseta");
    expect(() => tipoRoupa.excluir(), throwsException);
  });
  });
}