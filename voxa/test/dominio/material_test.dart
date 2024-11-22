import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MaterialRoupa', () {
    late MaterialRoupa materialRoupa;
    late DAOMaterialMemoria dao;

    setUp(() {
      dao = DAOMaterialMemoria();
      materialRoupa = MaterialRoupa(dao: dao, nome: "Algodão");
    });

    test('Deve salvar um material com sucesso', () async {
      var dto = await materialRoupa.salvar();
      expect(dto.nome, equals('Algodão'));
      expect(dto.id, isNotNull);
    });

    test('Deve alterar um material com sucesso', () async {
      var dto = await materialRoupa.salvar();
      materialRoupa.nome = 'Poliéster';
      var atualizado = await materialRoupa.alterar();
      expect(atualizado.nome, equals('Poliéster'));
    });

    test('Deve excluir um material com sucesso', () async {
      var dto = await materialRoupa.salvar();
      var resultado = await materialRoupa.excluir();
      expect(resultado, isTrue);
    });

    test('Deve listar materiais', () async {
      await materialRoupa.salvar();
      var materialRoupa2 = MaterialRoupa(dao: dao, nome: "Linho");
      await materialRoupa2.salvar();

      var lista = await materialRoupa.consultar();
      expect(lista.length, equals(2));
      expect(lista[0].nome, equals("Algodão"));
      expect(lista[1].nome, equals("Linho"));
    });

    test('Deve lançar exceção ao tentar alterar sem ID', () async {
      expect(() => materialRoupa.alterar(), throwsException);
    });

    test('Deve lançar exceção ao tentar excluir sem ID', () async {
      expect(() => materialRoupa.excluir(), throwsException);
    });
  });
}
