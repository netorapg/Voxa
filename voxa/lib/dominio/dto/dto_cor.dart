class DTOCor {
  int? id;
  String nome;
  String corHex;

  DTOCor({
    this.id,
    required this.nome,
    required this.corHex,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, 
      'nome': nome,
      'corHex': corHex,
    };
  }

  static DTOCor fromMap(Map<String, dynamic> map) {
    return DTOCor(
      id: map['id'],
      nome: map['nome'],
      corHex: map['corHex'],
    );
  }
}
