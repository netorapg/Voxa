//Venda{id, Cliente, Fornecedor, Função - cálculo comissão}
class Venda {
    int id;
    var cliente;
    var fornecedor;
    var funcao;
    Function calculo;
    var comissao;
    Venda({required this.id, required this.cliente, required this.fornecedor, required this.funcao, required this.calculo}){
      comissao = calculo;
    }
}