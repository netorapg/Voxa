import 'package:flutter_test/flutter_test.dart';
import 'package:voxa/banco/sqlite/dao_fornecedor.dart';
import 'package:voxa/dominio/fornecedor.dart';

void main() {
  group('Fornecedor', () {
    late Fornecedor fornecedor;
    late DAOFornecedorMemoria dao;

    setUp(() {
      dao = DAOFornecedorMemoria();
      fornecedor = Fornecedor(dao: dao, nome: "Fornecedor A", contato: "contato@fornecedor.com");
    });

    test('Deve salvar um fornecedor com sucesso', () async {
      var dto = await fornecedor.salvar();
      expect(dto.nome, equals('Fornecedor A'));
      expect(dto.contato, equals('contato@fornecedor.com'));
      expect(dto.id, isNotNull);
    });

    test('Deve alterar um fornecedor com sucesso', () async {
      var dto = await fornecedor.salvar();
      fornecedor.nome = 'Fornecedor B';
      fornecedor.contato = 'contatoB@fornecedor.com';
      fornecedor.id = 1;
      var atualizado = await fornecedor.alterar();
      expect(atualizado.nome, equals('Fornecedor B'));
      expect(atualizado.contato, equals('contatoB@fornecedor.com'));
    });

    test('Deve excluir um fornecedor com sucesso', () async {
      var dto = await fornecedor.salvar();
      fornecedor.id = 1;
      var resultado = await fornecedor.excluir();
      expect(resultado, isTrue);
    });

    test('Deve listar fornecedores', () async {
      await fornecedor.salvar();
      var fornecedor2 = Fornecedor(dao: dao, nome: "Fornecedor C", contato: "contatoC@fornecedor.com");
      await fornecedor2.salvar();

      var lista = await fornecedor.consultar();
      expect(lista.length, equals(2));
      expect(lista[0].nome, equals("Fornecedor A"));
      expect(lista[1].nome, equals("Fornecedor C"));
    });

    test('Deve lançar exceção ao tentar alterar sem ID', () async {
      expect(() => fornecedor.alterar(), throwsException);
    });

    test('Deve lançar exceção ao tentar excluir sem ID', () async {
      expect(() => fornecedor.excluir(), throwsException);
    });
  });
}
