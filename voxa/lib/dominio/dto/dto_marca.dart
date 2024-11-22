class DTOMarca{
  int? id; // O ID pode ser nulo antes de ser salvo
  String nome;

  DTOMarca({this.id, required this.nome});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  static DTOMarca fromMap(Map<String, dynamic> map) {
    return DTOMarca(
      id: map['id'],
      nome: map['nome'],
    );
  }
}
