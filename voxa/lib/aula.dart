import 'dart:io';

/*
main() {
  print('aula funções');
  print('digite o seu nome: ');
  var nome = stdin.readLineSync();
  print('idade');
  var entradaIdade = stdin.readLineSync()!;
  var idade = int.parse(entradaIdade);
  //var idade = entradaIdade as int;
  print('Meu nome é $nome, a minha idade é $idade');
}
  */

void primeiroPrint() {}

int nota1() {
  var entradaNota1 = stdin.readLineSync()!;
  var trataNota1 = int.parse(entradaNota1);
  return trataNota1;
}

int nota2() {
  var entradaNota2 = stdin.readLineSync()!;
  var trataNota2 = int.parse(entradaNota2);
  return trataNota2;
}

dadosValidos(x, y) {
  var xy;
  if (x < 0 || x > 10 && y < 0 || y > 10) {
    var xy = false;
  } else {
    var xy = true;
  }
  return xy;
}

double calculoMedia(x, y) {
  var media = (x + y) / 2;
  return media;
}

aprovado(x) {
  var aprovado;
  if (x > 6) {
    aprovado = true;
  } else {
    aprovado = false;
  }
  return aprovado;
}

main() {
  print('Calculo da média');
  print('digite a primeira nota: ');
  var x = nota1();
  print('digite a segunda nota: ');
  var y = nota2();
  dadosValidos(x, y);
  if (dadosValidos(x, y) == false) {
    print("Dados Inválidos");
  } else {
    print("A primeira nota é $x e asegunda é $y");
  }
  var z = calculoMedia(x, y);
  print('A média entre as duas notas é $z');
  aprovado(z);
  if (aprovado(z) == true) {
    print("aprovado");
  } else {
    print("reprovado");
  }
}



/*
Atividade 01
a) Solicite 2 notas de avaliações e calcule a média; 
b) Refaça o exercício anterior validado se as notas informadas são válidas (de 0 à 10);
c) Com a média calculada, verifique se o aluno está aprovado (maior ou igual à 6).
d) Faça 3 exemplos do seu projeto.
*/

/*
//Tela de boas-vindas
main() {
  print('Bem-vindo ao Voxa');
  print('Qual o seu nome? ');
  var nome = stdin.readLineSync();
  print('Olá $nome, você é sacoleiro?(S/N)');
  var eSacoleiro = stdin.readLineSync();
  if (eSacoleiro == 'S') {
    print(
        "Seja bem-vindo ao Voxa, seu estoque de bolso, ou melhor, de sacola ;)");
  } else {
    print("Ah, então vaza daqui $nome, ninguém gosta de um bisbilhoteiro >:(");
  }

}

void poloProximo(){
  print("Então $nome, você mora longe de onde compra seu estoque?(S/N)");
  var moraLonge = stdin.readLineSync();
  if (moraLonge == 'S') {
    print("o quão longe?v")

  }

}

*/


