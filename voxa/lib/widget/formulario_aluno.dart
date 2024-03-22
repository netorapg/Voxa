import 'package:flutter/material.dart';

class FormularioAluno extends StatelessWidget {
  const FormularioAluno({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Aluno')),
      body: const Text('Formulario Aluno'),
    );
  }
}
