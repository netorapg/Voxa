import 'package:flutter_test/flutter_test.dart';
import 'package:voxa/aplicacao/a_item.dart';
import 'dart:io';

void main() {
  group('Item', () {
    test('deve criar um item pelo Map', () {
      final map = {
        'id': 1,
        'tipo': 'Camiseta',
        'tamanhos': 'M',
        'cor': 'Azul',
        'marca': 'MarcaX',
        'material': 'Algodão',
        'quantidadeEmEstoque': 10,
        'fornecedor': 'FornecedorY',
        'imagem': null,
      };

      final item = Item.fromMap(map);

      expect(item.id, 1);
      expect(item.tipo, 'Camiseta');
      expect(item.tamanhos, 'M');
      expect(item.cor, 'Azul');
      expect(item.marca, 'MarcaX');
      expect(item.material, 'Algodão');
      expect(item.quantidadeEmEstoque, 10);
      expect(item.fornecedor, 'FornecedorY');
      expect(item.imagem, null);
    });

    test('deve converter um item pra Map', () {
      final item = Item(
        id: 1,
        tipo: 'Camiseta',
        tamanhos: 'M',
        cor: 'Azul',
        marca: 'MarcaX',
        material: 'Algodão',
        quantidadeEmEstoque: 10,
        fornecedor: 'FornecedorY',
        imagem: null,
      );

      final map = item.toMap();

      expect(map['id'], 1);
      expect(map['tipo'], 'Camiseta');
      expect(map['tamanhos'], 'M');
      expect(map['cor'], 'Azul');
      expect(map['marca'], 'MarcaX');
      expect(map['material'], 'Algodão');
      expect(map['quantidadeEmEstoque'], 10);
      expect(map['fornecedor'], 'FornecedorY');
      expect(map['imagem'], null);
    });

    test('deve lidar com arquivo em Item', () {
      final file = File('voxa/lib/assets/img/bag.png');
      final item = Item(
        id: 1,
        tipo: 'Camiseta',
        tamanhos: 'M',
        cor: 'Azul',
        marca: 'MarcaX',
        material: 'Algodão',
        quantidadeEmEstoque: 10,
        fornecedor: 'FornecedorY',
        imagem: file,
      );

      final map = item.toMap();

      expect(map['imagem'], file);
    });
  });
}