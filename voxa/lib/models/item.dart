class Item {
  String id;
  String name;
  int quantity;
  DateTime dateAdded;

  Item({
    required this.id,
    required this.name,
    required this.quantity,
    required this.dateAdded,
  });

  // Método para converter um Item em um Map (para banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'dateAdded': dateAdded.toIso8601String(),
    };
  }

  // Método para criar um Item a partir de um Map (do banco de dados)
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item( 
      id: map['id'],
      name : map['name'],
      quantity: map['quantity'],
      dateAdded: DateTime.parse(map['dateAdded']),
    );
  }
}