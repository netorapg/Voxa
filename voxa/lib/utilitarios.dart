import 'package:flutter/material.dart';

class Utilitarios {

  Widget criarBotaoDeNavegacao({required nome, required contexto, required rota}) {
    return ElevatedButton(
      child: Text(nome),
      onPressed: () {
        Navigator.pushNamed(contexto, rota);
      },
    );
  }
  Widget criarBotaoDeRetorno({required nome, required contexto}){
        return ElevatedButton(onPressed: () => Navigator.pop(contexto),
        child: Text(nome)
        );
          }


}

