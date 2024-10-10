import 'package:flutter_test/flutter_test.dart';
import 'package:voxa/banco/sqlite/dao_tamanho.dart';
import 'package:voxa/dominio/tamanho.dart';

void main() {
  group('TamanhoRoupa', () {
    late TamanhoRoupa tamanhoRoupa;
    late DAOTamanhoMemoria dao;

    setUp(() {
      dao = DAOTamanhoMemoria();
      tamanhoRoupa = TamanhoRoupa(dao: dao, nome: "M");
    });

    test('Deve salvar um tamanho de roupa com sucesso', () async {
      var dto = await tamanhoRoupa.salvar();
      expect(dto.nome, equals('M'));
      expect(dto.id, isNotNull);
    });

    test('Deve alterar um tamanho de roupa com sucesso', () async {
      var dto = await tamanhoRoupa.salvar();
      tamanhoRoupa.nome = 'G';
      var atualizado = await tamanhoRoupa.alterar();
      expect(atualizado.nome, equals('G'));
    });

    test('Deve excluir um tamanho de roupa com sucesso', () async {
      var dto = await tamanhoRoupa.salvar();
      var resultado = await tamanhoRoupa.excluir();
      expect(resultado, isTrue);
    });

    test('Deve listar tamanhos de roupas', () async {
      await tamanhoRoupa.salvar();
      var tamanhoRoupa2 = TamanhoRoupa(dao: dao, nome: "P");
      await tamanhoRoupa2.salvar();

      var lista = await tamanhoRoupa.consultar();
      expect(lista.length, equals(2));
      expect(lista[0].nome, equals("M"));
      expect(lista[1].nome, equals("P"));
    });

    test('Deve lançar exceção ao tentar alterar sem ID', () async {
      expect(() => tamanhoRoupa.alterar(), throwsException);
    });

    test('Deve lançar exceção ao tentar excluir sem ID', () async {
      expect(() => tamanhoRoupa.excluir(), throwsException);
    });
  });
}
