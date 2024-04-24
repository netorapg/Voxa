import 'package:flutter/material.dart';

class WidgetTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tabela'),
        ),
        body: criarTabela());
  }

  criarTabela() {
    return Table(
      defaultColumnWidth: FixedColumnWidth(150.0),
      border: TableBorder(
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
          child: Text(
            name,
            style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(),
    );
  }
}
