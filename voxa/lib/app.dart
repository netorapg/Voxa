
import 'package:flutter/material.dart';
import 'package:voxa/rota.dart';
import 'package:voxa/widget/estoque.dart';
import 'package:voxa/widget/info.dart';
import 'package:voxa/widget/cadastro.dart';

class App extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Meu App',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: false,
      ),
      routes: {
        Rota.estoque :(context) => Estoque(),
        Rota.info:(context) => const Informacoes(),
        Rota.cadastro:(context) => const Cadastro()
      },
    );
  }
}