import 'package:flutter/material.dart';

class WidgetTable extends StatelessWidget {
  const WidgetTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tabela'),
        ),
        body: criarTabela());
  }

  criarTabela() {
    return Table(
      defaultColumnWidth: const FixedColumnWidth(150.0),
      border: const TableBorder(
        horizontalInside: BorderSide(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      children: [
        _criarLinhaTable("Pontos, Time, Gols"),
        _criarLinhaTable("1, Flamengo, 10"),
        _criarLinhaTable("2, Vasco, 8"),
        _criarLinhaTable("3, Fluminense, 6"),
      ],
    );
  }

  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: const TextStyle(fontSize: 20.0),
          ),
        );
      }).toList(),
    );
  }
}
