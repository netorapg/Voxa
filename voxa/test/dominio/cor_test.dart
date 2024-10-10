import 'package:flutter_test/flutter_test.dart';
import 'package:voxa/banco/sqlite/dao_cor.dart';
import 'package:voxa/dominio/cor.dart';

void main() {
  group('CorRoupa', () {
    late CorRoupa corRoupa;
    late DAOCorMemoria dao;

    setUp(() {
      dao = DAOCorMemoria();
      corRoupa = CorRoupa(dao: dao, nome: "Azul");
    });

    test('Deve salvar uma cor com sucesso', () async {
      var dto = await corRoupa.salvar();
      expect(dto.nome, equals('Azul'));
      expect(dto.id, isNotNull);
    });

    test('Deve alterar uma cor com sucesso', () async {
      var dto = await corRoupa.salvar();
      corRoupa.nome = 'Verde';
      var atualizado = await corRoupa.alterar();
      expect(atualizado.nome, equals('Verde'));
    });

    test('Deve excluir uma cor com sucesso', () async {
      var dto = await corRoupa.salvar();
      var resultado = await corRoupa.excluir();
      expect(resultado, isTrue);
    });

    test('Deve listar cores', () async {
      await corRoupa.salvar();
      var corRoupa2 = CorRoupa(dao: dao, nome: "Vermelho");
      await corRoupa2.salvar();

      var lista = await corRoupa.consultar();
      expect(lista.length, equals(2));
      expect(lista[0].nome, equals("Azul"));
      expect(lista[1].nome, equals("Vermelho"));
    });

    test('Deve lançar exceção ao tentar alterar sem ID', () async {
      expect(() => corRoupa.alterar(), throwsException);
    });

    test('Deve lançar exceção ao tentar excluir sem ID', () async {
      expect(() => corRoupa.excluir(), throwsException);
    });
  });
}
