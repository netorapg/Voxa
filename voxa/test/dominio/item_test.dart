import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:voxa/dominio/item.dart';
import 'package:voxa/dominio/dto/dto_item.dart';
import 'package:voxa/dominio/interface/i_dao_item.dart';

class DAOItemFake implements IDAOItem {
  @override
  Future<DTOItem> salvar(DTOItem dto) async {
    return dto;
  }
}

void main() {
  group('Item Tests', () {
    late DAOItemFake daoItemFake;
    late DTOItem dtoItem;
    late Item item;

    setUp(() {
      daoItemFake = DAOItemFake();
      dtoItem = DTOItem(
        id: 1,
        tipo: 'Camisa',
        tamanhos: 'M',
        cor: 'Azul',
        marca: 'Nike',
        material: 'Algodão',
        quantidadeEmEstoque: 10,
        fornecedor: 'Fornecedor X',
        imagem: File('voxa/lib/assets/img/bag.png')
      );
      item = Item(
        id: dtoItem.id,
        tipo: dtoItem.tipo,
        tamanhos: dtoItem.tamanhos,
        cor: dtoItem.cor,
        marca: dtoItem.marca,
        material: dtoItem.material,
        quantidadeEmEstoque: dtoItem.quantidadeEmEstoque,
        fornecedor: dtoItem.fornecedor,
        imagem: dtoItem.imagem, dao: daoItemFake
      );
      item.dao = daoItemFake;
    });

    test('Item deve ser criado de DTOItem', () {
      expect(item.id, dtoItem.id);
      expect(item.tipo, dtoItem.tipo);
      expect(item.tamanhos, dtoItem.tamanhos);
      expect(item.cor, dtoItem.cor);
      expect(item.marca, dtoItem.marca);
      expect(item.material, dtoItem.material);
      expect(item.quantidadeEmEstoque, dtoItem.quantidadeEmEstoque);
      expect(item.fornecedor, dtoItem.fornecedor);
      expect(item.imagem, dtoItem.imagem);
    });

    test('Item deve converter para Map corretamente', () {
      final itemMap = item.toMap();
      expect(itemMap['id'], dtoItem.id);
      expect(itemMap['tipo'], dtoItem.tipo);
      expect(itemMap['tamanhos'], dtoItem.tamanhos);
      expect(itemMap['cor'], dtoItem.cor);
      expect(itemMap['marca'], dtoItem.marca);
      expect(itemMap['material'], dtoItem.material);
      expect(itemMap['quantidadeEmEstoque'], dtoItem.quantidadeEmEstoque);
      expect(itemMap['fornecedor'], dtoItem.fornecedor);
      expect(itemMap['imagem'], dtoItem.imagem);
    });

    test('Item deve ser criado de Map corretamente', () {
      final itemMap = {
        'id': dtoItem.id,
        'tipo': dtoItem.tipo,
        'tamanhos': dtoItem.tamanhos,
        'cor': dtoItem.cor,
        'marca': dtoItem.marca,
        'material': dtoItem.material,
        'quantidadeEmEstoque': dtoItem.quantidadeEmEstoque,
        'fornecedor': dtoItem.fornecedor,
        'imagem': dtoItem.imagem
      };
      final newItem = Item.fromMap(itemMap, daoItemFake);
      expect(newItem.id, dtoItem.id);
      expect(newItem.tipo, dtoItem.tipo);
      expect(newItem.tamanhos, dtoItem.tamanhos);
      expect(newItem.cor, dtoItem.cor);
      expect(newItem.marca, dtoItem.marca);
      expect(newItem.material, dtoItem.material);
      expect(newItem.quantidadeEmEstoque, dtoItem.quantidadeEmEstoque);
      expect(newItem.fornecedor, dtoItem.fornecedor);
      expect(newItem.imagem, dtoItem.imagem);
    });

    test('Item deve chamar DAO para salvar', () async {
      final result = await item.incluir();
      expect(result, dtoItem);
    });
  });
}
