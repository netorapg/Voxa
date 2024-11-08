class DTOTamanho {
  int? id; // O ID pode ser nulo antes de ser salvo
  String nome;

  DTOTamanho({this.id, required this.nome});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  static DTOTamanho fromMap(Map<String, dynamic> map) {
    return DTOTamanho(
      id: map['id'],
      nome: map['nome'],
    );
  }
}
