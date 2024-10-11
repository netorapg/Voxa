import 'package:flutter_test/flutter_test.dart';
import 'package:voxa/banco/sqlite/dao_tipo_roupa.dart';
import 'package:voxa/dominio/tipo.dart';

void main() {
  group('TipoRoupa', () {
    late TipoRoupa tipoRoupa;
    late DAOTipoRoupaMemoria dao;

    setUp(() {
      dao = DAOTipoRoupaMemoria();
      tipoRoupa = TipoRoupa(dao: dao, nome: "Camiseta");
    });

    test('Deve salvar um tipo de roupa com sucesso', () async {
      var dto = await tipoRoupa.salvar();
      expect(dto.nome, equals('Camiseta'));
      expect(dto.id, isNotNull);
    });

    test('Deve alterar um tipo de roupa com sucesso', () async {
      var dto = await tipoRoupa.salvar();
      tipoRoupa.id = 1;
      tipoRoupa.nome = 'Camiseta Manga Longa';
      var atualizado = await tipoRoupa.alterar();
      expect(atualizado.nome, equals('Camiseta Manga Longa'));
    });

    test('Deve excluir um tipo de roupa com sucesso', () async {
      var dto = await tipoRoupa.salvar();
      tipoRoupa.id = 1;
      var resultado  = await tipoRoupa.excluir();
      expect(resultado, isTrue);
    });

    test('Deve listar tipos de roupas', () async {
      await tipoRoupa.salvar();
      var tipoRoupa2 = TipoRoupa(dao: dao, nome: "Calça");
      await tipoRoupa2.salvar();

      var lista = await tipoRoupa.consultar();
      expect(lista.length, equals(2));
      expect(lista[0].nome, equals("Camiseta"));
      expect(lista[1].nome, equals("Calça"));
    });

    test('Deve lançar exceção ao tentar alterar sem ID', () async {
      expect(() => tipoRoupa.alterar(), throwsException);
    });

    test('Deve lançar exceção ao tentar excluir sem ID', () async {
      expect(() => tipoRoupa.excluir(), throwsException);
    });
  });
}