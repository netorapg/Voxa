import 'package:flutter/material.dart';

import 'package:voxa/dominio/interface/i_dao_tamanho.dart'; // Importa a interface do DAO
import 'package:voxa/dominio/interface/i_dao_tipo.dart';

import 'package:voxa/screens/home.dart';
import 'package:voxa/screens/tamanho_tela.dart';
import 'package:voxa/widget/rota.dart';

class App extends StatelessWidget {
  final IDAOTamanho? daoTamanho;
  final IDAOTipoRoupa? daoTipo;

  // O parâmetro dao agora é opcional
  const App({super.key, this.daoTamanho, this.daoTipo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 212, 88)),
        useMaterial3: false,
      ),
      routes: {
        Rota.estoque: (context) => const Estoque(),
        Rota.tamanhoTela: (context) => const TamanhoListPage(), // Usa dao ou um padrão
       // Rota.tipo: (context) => const TipoRoupaScreen()
      },
    );
  }
}
