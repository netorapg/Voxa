
import 'package:voxa/dominio/interface/i_dao_item.dart';
import 'package:voxa/dominio/item.dart';

class AItem {
  Item item;
  IDAOItem dao;

  AItem({required this.item, required this.dao});
  salvar() {
    item.incluir();
  }
}