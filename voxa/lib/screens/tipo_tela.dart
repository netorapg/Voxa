
// Classe de exemplo para usar o GerenciadorListaPage
import 'package:flutter/material.dart';
import 'package:voxa/banco/sqlite/dao_tipo_roupa.dart';
import 'package:voxa/dominio/dto/dto_tipo.dart';
import 'package:voxa/widget/gerenciador.dart';

class TipoPage extends StatelessWidget {
  const TipoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dao = DAOTipoMemoria();

    return GerenciadorListaPage<DTOTipoRoupa>(
      titulo: 'Lista de Tipos',
      nomeItem: 'Tipo',
      carregarItens: dao.consultar,
      excluirItem: dao.excluir,
      salvarItem: dao.salvar,
      alterarItem: dao.alterar,
      obterNome: (tipo) => tipo.nome,
      obterId: (tipo) => tipo.id,
      criarItem: (nome) => DTOTipoRoupa(id: null, nome: nome),
    );
  }
}
