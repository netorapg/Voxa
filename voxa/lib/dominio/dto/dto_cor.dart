class DTOCor {
  int? id;
  String nome;

  DTOCor({
    this.id,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, 
      'nome': nome,
    };
  }

  static DTOCor fromMap(Map<String, dynamic> map) {
    return DTOCor(
      id: map['id'],
      nome: map['nome'],
    );
  }
}
