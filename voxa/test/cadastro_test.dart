import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voxa/screens/cadastro.dart';

void main() {
  group('Cadastro', () {
    testWidgets('Deve verificar se os campos obrigatórios estão preenchidos', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Cadastro()));

      await tester.tap(find.text('Cadastrar'));
      await tester.pump();

      expect(find.text('Campo obrigatório'), findsNWidgets(4));
    });

    testWidgets('Deve incrementar e decrementar a quantidade em estoque', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Cadastro()));

      expect(find.text('0'), findsOneWidget);

      // Incrementa a quantidade
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);

      // Decrementa a quantidade
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('0'), findsOneWidget);
    });


void main() {
  group('Cadastro - Seleção de Tipo', () {
    testWidgets('Deve permitir a seleção do tipo de roupa e atualizar o estado', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Cadastro()));

      // Abre o diálogo de seleção de tipo
      await tester.tap(find.byKey(const Key('edit-tipo-button')));
      await tester.pumpAndSettle();

      // Seleciona a opção 'Camisa'
      await tester.tap(find.byKey(const Key('radio-camisa')));
      await tester.pumpAndSettle();

      // Verifica se o tipo selecionado foi atualizado para 'Camisa'
      expect(find.text('Camisa'), findsOneWidget);

      // Abre o diálogo novamente
      await tester.tap(find.byKey(const Key('edit-tipo-button')));
      await tester.pumpAndSettle();

      // Seleciona a opção 'Vestido'
      await tester.tap(find.byKey(const Key('radio-vestido')));
      await tester.pumpAndSettle();

      // Verifica se o tipo selecionado foi atualizado para 'Vestido'
      expect(find.text('Vestido'), findsOneWidget);
    });
  });
}


    testWidgets('Deve mostrar mensagem de erro ao tentar cadastrar sem imagem', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Cadastro()));

      await tester.enterText(find.byType(TextFormField).at(0), 'Cores');
      await tester.enterText(find.byType(TextFormField).at(1), 'Marca');
      await tester.enterText(find.byType(TextFormField).at(2), 'Material');
      await tester.enterText(find.byType(TextFormField).at(3), 'Fornecedor');

      await tester.tap(find.text('Cadastrar'));
      await tester.pump();

      expect(find.text('Tire uma foto da peça para continuar.'), findsOneWidget);
    });

    testWidgets('Deve mostrar rascunho ao preencher todos os campos corretamente', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Cadastro()));

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      await tester.enterText(find.byType(TextFormField).at(0), 'Cores');
      await tester.enterText(find.byType(TextFormField).at(1), 'Marca');
      await tester.enterText(find.byType(TextFormField).at(2), 'Material');
      await tester.enterText(find.byType(TextFormField).at(3), 'Fornecedor');

      // Simula a foto tirada (considerando que o código do teste tem que ser ajustado caso use um mock de imagem)
      // Nesse exemplo, o teste ignora a parte da imagem para focar na lógica do rascunho
      // await tester.tap(find.text('Tirar Foto da Peça'));
      // await tester.pump();
      
      // Assume que a imagem foi tirada corretamente
      await tester.tap(find.text('Cadastrar'));
      await tester.pump();

      expect(find.text('Rascunho'), findsOneWidget);
      expect(find.text('Concluir Cadastro'), findsOneWidget);
    });
  });
}
