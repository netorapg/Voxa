class Peca {
    String nomeDaPeca;
    String tamanhoDaPeca;
    String tipoMaterial;
    String cor;
    int quantidade;
    Peca({required this.nomeDaPeca, required this.tamanhoDaPeca, required this.tipoMaterial, required this.cor, required this.quantidade}){
      print('Nome da Peça: $nomeDaPeca, Tamanho da Peça: $tamanhoDaPeca, Tipo do Material: $tipoMaterial, Cor: $cor, Qtd: $quantidade');
    }
}