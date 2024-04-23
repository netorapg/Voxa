import 'package:flutter/material.dart';
import 'package:voxa/app.dart';
import 'package:voxa/rota.dart';
import 'package:voxa/utilitarios.dart';
import 'package:voxa/widget/info.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro do Produto')),
      body: Column(
        children: [
          const Text('Lista Aluno'),
        ],
      ),
    );
  }
}
