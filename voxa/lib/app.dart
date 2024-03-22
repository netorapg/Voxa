
import 'package:flutter/material.dart';
import 'package:voxa/rota.dart';
import 'package:voxa/widget/principal.dart';
import 'package:voxa/widget/formulario_aluno.dart';
import 'package:voxa/widget/lista_aluno.dart';

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
        Rota.home :(context) => Principal(),
        Rota.formAluno:(context) => FormularioAluno(),
        Rota.listaAluno:(context) => ListaAluno()
      },
    );
  }
}