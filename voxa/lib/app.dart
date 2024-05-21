
import 'package:flutter/material.dart';
import 'package:voxa/widget/rota.dart';
import 'package:voxa/screens/estoque.dart';
import 'package:voxa/screens/info.dart';
import 'package:voxa/screens/cadastro.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Meu App',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 212, 88)),
        useMaterial3: false,
      ),
      routes: {
        Rota.estoque :(context) => const Estoque(),
        Rota.info:(context) => const Informacoes(),
        Rota.cadastro:(context) => const Cadastro()
      },
    );
  }
}