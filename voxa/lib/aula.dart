import 'dart:io';


main() {
  print('aula funções');
  print('digite o seu nome: ');
  String? nome = stdin.readLineSync();
  print('idade');
  var entradaIdade = stdin.readLineSync()!;
  var idade = int.parse(entradaIdade);
  //var idade = entradaIdade as int;
  print('Meu nome é $nome, a minha idade é $idade');
}
  
/*
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

*/

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

/*

Atividade 02
a) Em programação o null é um problema? Explique.
O null, não é em si o problema, mas ele pode  causá-lo. Pois quando um dado é nulo, quando o programa necessitar que esse dado tenha um valor, ele irá acarretar
em uma falha, como de travar completamente o sistema, por exemplo.
b) O que é null safety? para que serve? Quais são as vantagens e desvantagens?
Null safety são parâmetros que "asseguram" o uso do null, como o ? que indica que uma variavel pode receber o valor nulo e o ! que 
indica que o programa pode confiar que não acarretará em um erro. Uma vantagem do null safety seria a eficiência na hora do desenvolvimento,
contudo, é mais recomendado não usa-lo, pois é um risco muitas vezes desnecessário a se passar.
c) Faça um exemplo do uso incorreto de um dos operadores Null Safety.

d) Em relação ao Null Safety, quais são os operadores existentes? Para que serve cada uma. No contexto do seu projeto, escreva um exemplo do uso correto de cada operador.

Atividade 03
a) Organize todo o código do estudo de caso desenvolvido até o momento em funções;
b) Organize todo o código do seu projeto desenvolvido até o momento em funções;

Atividade 04

a) Quais são os tipos de parâmetros em dart? Explique as diferenças, vantagens e desvantagens de cada uma.
b) Em relação a cada tipo de parâmetro, faça 3 exemplos do estudo de caso. 
c) Em relação a cada tipo de parâmetro, faça 3 exemplos do projeto. 
 */

