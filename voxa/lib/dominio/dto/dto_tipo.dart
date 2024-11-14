class DTOTipoRoupa {
  int? id; // O ID pode ser nulo antes de ser salvo
  String nome;

  DTOTipoRoupa({this.id, required this.nome});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  static DTOTipoRoupa fromMap(Map<String, dynamic> map) {
    return DTOTipoRoupa(
      id: map['id'],
      nome: map['nome'],
    );
  }
}
