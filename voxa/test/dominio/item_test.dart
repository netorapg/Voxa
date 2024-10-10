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
  
  @override
  Future<DTOItem> alterar(DTOItem dto) async {
    // Simula a alteração de um item
    return dto;
  }
  
  @override
  Future<List<DTOItem>> consultar() async {
    return []; // Retorna uma lista vazia para simular consulta
  }
  
  @override
  Future<DTOItem> consultarPorId(int id) async {
    return DTOItem(
      id: id,
      tipo: 'Simulação',
      tamanhos: 'M',
      cor: 'Azul',
      marca: 'Nike',
      material: 'Algodão',
      quantidadeEmEstoque: 10,
      fornecedor: 'Fornecedor X',
      imagem: File('voxa/lib/assets/img/bag.png')
    ); // Retorna um item simulado
  }
  
  @override
  Future<bool> excluir(int id) async {
    return true; // Simula a exclusão com sucesso
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
        imagem: dtoItem.imagem,
        dao: daoItemFake
      );
      item.dao = daoItemFake;
    });

    test('id não pode ser nulo', () {
      expect(() => Item(id: null, dao: daoItemFake), throwsAssertionError);
    });

    test('tipo não pode ser nulo', () {
      expect(() => Item(tipo: null, dao: daoItemFake, id: 1), throwsAssertionError);
    });

    test('tamanhos não pode ser nulo', () {
      expect(() => Item(tamanhos: null, dao: daoItemFake, id: 1), throwsAssertionError);
    });

    test('cor não pode ser nulo', () {
      expect(() => Item(cor: null, dao: daoItemFake, id: 1), throwsAssertionError);
    });

    test('marca não pode ser nulo', () {
      expect(() => Item(marca: null, dao: daoItemFake, id: 1), throwsAssertionError);
    });

    test('material não pode ser nulo', () {
      expect(() => Item(material: null, dao: daoItemFake, id: 1), throwsAssertionError);
    });

    test('quantidadeEmEstoque não pode ser nulo', () {
      expect(() => Item(quantidadeEmEstoque: null, dao: daoItemFake, id: 1), throwsAssertionError);
    });

    test('fornecedor não pode ser nulo', () {
      expect(() => Item(fornecedor: null, dao: daoItemFake, id: 1), throwsAssertionError);
    });

    test('imagem não pode ser nulo', () {
      expect(() => Item(imagem: null, dao: daoItemFake, id: 1), throwsAssertionError);
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
      expect(item.imagem.path, dtoItem.imagem.path); // Modificado para comparar o caminho da imagem
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
      expect(itemMap['imagem'], dtoItem.imagem.path); // Modificado para comparar o caminho da imagem
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
        'imagem': dtoItem.imagem.path // Modificado para usar o caminho da imagem
      };
      final newItem = Item.fromMap(itemMap, daoItemFake); // Verifique se esse método está definido na classe Item
      expect(newItem.id, dtoItem.id);
      expect(newItem.tipo, dtoItem.tipo);
      expect(newItem.tamanhos, dtoItem.tamanhos);
      expect(newItem.cor, dtoItem.cor);
      expect(newItem.marca, dtoItem.marca);
      expect(newItem.material, dtoItem.material);
      expect(newItem.quantidadeEmEstoque, dtoItem.quantidadeEmEstoque);
      expect(newItem.fornecedor, dtoItem.fornecedor);
      expect(newItem.imagem.path, dtoItem.imagem.path); // Modificado para comparar o caminho da imagem
    });

    test('Item deve chamar DAO para salvar', () async {
      final result = await item.salvar();
      expect(result, dtoItem);
    });
  });
}
