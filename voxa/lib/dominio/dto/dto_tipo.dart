class DTOTipoRoupa {
  int? id;
  String nome;

  DTOTipoRoupa({this.id, required this.nome});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  factory DTOTipoRoupa.fromMap(Map<String, dynamic> map) {
    return DTOTipoRoupa(
      id: map['id'] as int?,
      nome: map['nome'] as String,
    );
  }
}
