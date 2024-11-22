class DTOMaterial{
  int? id; // O ID pode ser nulo antes de ser salvo
  String nome;

  DTOMaterial({this.id, required this.nome});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  static DTOMaterial fromMap(Map<String, dynamic> map) {
    return DTOMaterial(
      id: map['id'],
      nome: map['nome'],
    );
  }
}
