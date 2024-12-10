import 'package:flutter/material.dart';
import 'package:voxa/dominio/interface/i_dao_fornecedor.dart';
import 'package:voxa/dominio/interface/i_dao_marca.dart';
import 'package:voxa/dominio/interface/i_dao_material.dart';
import 'package:voxa/dominio/interface/i_dao_tamanho.dart'; 
import 'package:voxa/dominio/interface/i_dao_tipo.dart';
import 'package:voxa/screens/fornecedor_tela.dart';

import 'package:voxa/screens/home.dart';
import 'package:voxa/screens/marca_tela.dart';
import 'package:voxa/screens/tamanho_tela.dart';
import 'package:voxa/screens/tipo_tela.dart';
import 'package:voxa/screens/material_tela.dart' as custom;

import 'package:voxa/widget/rota.dart';

class App extends StatelessWidget {
  final IDAOTamanho? daoTamanho;
  final IDAOTipoRoupa? daoTipo;
  final IDAOMaterial? daoMaterial;
  final IDAOMarca? daoMarca;
  final IDAOFornecedor? daoFornecedor;

  // O parâmetro dao agora é opcional
  const App({super.key, this.daoTamanho, this.daoTipo, this.daoMaterial, this.daoMarca, this.daoFornecedor});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 236, 236, 236)),
        useMaterial3: false,
      ),
      routes: {
        Rota.estoque: (context) => const Estoque(),
        Rota.tamanho: (context) => const TamanhoListPage(), // Usa dao ou um padrão
        Rota.tipo: (context) => const TipoPage(),
        Rota.material: (context) => const custom.MaterialPage(),
        Rota.marca: (context) => const MarcaPage(),
        Rota.fornecedor: (context) => const FornecedorPage()
      },
    );
  }
}
