import 'package:flutter/material.dart';

class Informacoes extends StatelessWidget {
  const Informacoes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Informações do Produto')),
      body: const Text('Info'),
    );
  }
}
