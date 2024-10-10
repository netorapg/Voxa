import 'package:flutter_test/flutter_test.dart';
import 'package:voxa/banco/sqlite/dao_marca.dart';
import 'package:voxa/dominio/marca.dart';

void main() {
  group('MarcaRoupa', () {
    late MarcaRoupa marcaRoupa;
    late DAOMarcaMemoria dao;

    setUp(() {
      dao = DAOMarcaMemoria();
      marcaRoupa = MarcaRoupa(dao: dao, nome: "Nike");
    });

    test('Deve salvar uma marca com sucesso', () async {
      var dto = await marcaRoupa.salvar();
      expect(dto.nome, equals('Nike'));
      expect(dto.id, isNotNull);
    });

    test('Deve alterar uma marca com sucesso', () async {
      var dto = await marcaRoupa.salvar();
      marcaRoupa.nome = 'Adidas';
      var atualizado = await marcaRoupa.alterar();
      expect(atualizado.nome, equals('Adidas'));
    });

    test('Deve excluir uma marca com sucesso', () async {
      var dto = await marcaRoupa.salvar();
      var resultado = await marcaRoupa.excluir();
      expect(resultado, isTrue);
    });

    test('Deve listar marcas', () async {
      await marcaRoupa.salvar();
      var marcaRoupa2 = MarcaRoupa(dao: dao, nome: "Puma");
      await marcaRoupa2.salvar();

      var lista = await marcaRoupa.consultar();
      expect(lista.length, equals(2));
      expect(lista[0].nome, equals("Nike"));
      expect(lista[1].nome, equals("Puma"));
    });

    test('Deve lançar exceção ao tentar alterar sem ID', () async {
      expect(() => marcaRoupa.alterar(), throwsException);
    });

    test('Deve lançar exceção ao tentar excluir sem ID', () async {
      expect(() => marcaRoupa.excluir(), throwsException);
    });
  });
}
