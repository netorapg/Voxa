import 'package:voxa/aula/Cidade.dart';
import 'package:voxa/aula/Cliente.dart';
import 'package:voxa/aula/Estado.dart';
import 'package:voxa/aula/Fornecedor.dart';
import 'package:voxa/aula/Peca.dart';
import 'package:voxa/aula/Venda.dart';

void main (List<String> args){
  //var peca1 = Peca(nomeDaPeca: "Camisa", tipoMaterial: "Algodão", tamanhoDaPeca: "GG", cor: "Terracota", quantidade: 13);
  //var peca2 = Peca(cor: "Azul", nomeDaPeca: "Calça", quantidade: 5, tipoMaterial: "Jeans", tamanhoDaPeca: "48");
  var venda1 = Venda(id: 1, cliente: Cliente(id: 1, nome: "Rafael", 
  cidade_trabalho: Cidade(id:1, nome: "Cabo Frio", estado: Estado(id:1, nome: "Rio de Janeiro", sigla: "RJ")),
  cidade_moradia: Cidade(id:2, nome: "Paranavaí", estado: Estado(id:2, nome: "Paraná", sigla: "PR"))), 
  fornecedor: Fornecedor(id: 2, nome: "Renato", 
  cidade_trabalho: Cidade(id:3, nome: "Belo Horizonte", estado: Estado(id:3, nome: "Minas Gerais", sigla: "MG")),
  cidade_moradia: Cidade(id:4, nome: "Ariquemes", estado: Estado(id:4, nome: "Rondônia", sigla: "RO"))), funcao: "Técnico T.I.",
   calculo: () => (1500 + 0.5));
  print('id:${venda1.id}, Cliente: ${venda1.cliente.nome}, Fornecedor: ${venda1.fornecedor.nome}, Função: ${venda1.funcao}, Comissão: ${venda1.comissao}}');
}

/*
Criar as seguintes classes: 
  >> Todos com parâmetros nomeados no construtor
  Estado{id,nome,sigla}
  Cidade{id,nome,Estado}
  Cliente{id,nome,Cidade -trabalho, Cidade -moradia}
  Fornecedor{id,nome,Cidade -trabalho, Cidade -moradia}
  Venda{id, Cliente, Fornecedor, Função - cálculo comissão}
*/