import 'package:flutter/material.dart';
import 'package:voxa/backgroundImage.dart';
import 'package:voxa/rota.dart';
import 'package:voxa/utilitarios.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela principal"),
      ),
      body: const BackgroundImage(),
    );
  }
}
