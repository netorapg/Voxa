import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voxa/screens/cadastro.dart';

void main() {
  group('Cadastro', () {
    testWidgets('Deve verificar se os campos obrigatórios estão preenchidos', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Cadastro()));

      await tester.tap(find.text('Cadastrar'));
      await tester.pump();

      expect(find.text('Campo obrigatório'), findsNWidgets(4));
    });

  
   

  
  });
}