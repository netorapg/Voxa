
main() {
  funcaoVoxaAnonima(pecaDeRoupa: "Camisa", tamanho: "GG", 
  quantidade: 60, promocao: (int x){  
     if(x >= 50){
        print("Faça uma promoção");
      } else{
        print("Sem promoção");
      }
  });
  
}  

void funcaoVoxaAnonima({required String pecaDeRoupa, required String tamanho, 
String material = "Algodão", required int quantidade, required Function(int) promocao}){
 print('a peça é uma $pecaDeRoupa de tamanho $tamanho feita de $material. Chegaram $quantidade dessa peça');
 promocao(quantidade);
}

  bool? opinao(bool x){
    if(x == true){
      print("Positivas");
    } else{
      print("Negativas");
    }
    return null;
  }

  String? vendeOuGuarda(String x){
    if (x == "Verão"){
      print("Vender Agora");
    }
    else {
      print("Aguarde para a próxima estação");
    }
    return null;
  }


  void queimaEstoque(int x){
      if(x >= 50){
        print("Faça uma promoção");
      } else{
        print("Sem promoção");
      }
  }




 /*
  print(ehAprovado(nota1: 6, nota2: 7, calcularMedia: Media, faltas: 10));
  print(ehAprovado(nota1: 6, nota2: 7, 
  calcularMedia: (double n1, double n2) => (n1 * 0.4 + n2 * 0.5) / 2,
   faltas: 10));
  */
  void funcaoVoxaTipoFuncao({required String pecaDeRoupa, required String tamanho, 
  String material = "Algodão", required String estacao, required int quantidade, required Function(int) promocao, 
  required Function(String) VG, required Function(bool) desejada, required bool avaliacao}){
  print('a peça é uma $pecaDeRoupa de tamanho $tamanho feita de $material. Chegaram $quantidade dessa peça');
  promocao(quantidade);
  vendeOuGuarda(estacao);
  desejada(avaliacao);
  }

//parametro do tipo função
void sintaxeParametroFuncao(int x, int y, Function(int, int) f){
  if(x > 10){
    x = 0;
  }
  if(y > 5) {
    y = 10;
  }
  return f(x, y);
}


void funcaoVoxaNomeado({required String pecaDeRoupa, 
required String tamanho, 
String material = "Algodão", String? cor}){
  print('a peça é uma $pecaDeRoupa de tamanho $tamanho feita de $material. Sua cor é $cor');
}


void funcao(int x, String y){
  print("variável x é $x e y é $y");
 // print('o aluno está ${ehAprovado(nota1: 6, nota2: 7, Media(), faltas: 5, mediaAprovacao: 6, faltasMaxima: 10)}');
  funcaoParamNomeado(idade: 22, nome: 'Renato');
  funcaoParamNomeado(nome: 'Carla', idade: 21);
  funcaoParamNomeado(nome: 'Rafael');
  funcaoParamNomeado(idade: 23);
  

}


void funcaoParamNomeado({int idade = 0, String nome= "Mario"}){
  print('nome: $nome, idade $idade');
}

bool ehAprovado(
  {required double nota1, 
  required double nota2,
  required Function(double, double) calcularMedia,
  required faltas,
  double mediaAprovacao = 6, 
  int faltasMaxima = 10}){
  var media = calcularMedia(nota1, nota2);
  var ehAprovadoNota = (media >= mediaAprovacao);
  var ehAprovadoFaltas = faltas <= faltasMaxima;
  return ehAprovadoNota && ehAprovadoFaltas;
}

double? Media(double x, double y){
  double media = (x + y) / 2;
  return media;
}


