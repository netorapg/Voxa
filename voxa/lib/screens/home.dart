import 'package:flutter/material.dart';
import 'package:voxa/widget/rota.dart';

class Estoque extends StatefulWidget {
  const Estoque({super.key});

  @override
  State<Estoque> createState() => _EstoqueState();
}

class _EstoqueState extends State<Estoque> {
  final List<Map<String, dynamic>> roupas = [
    {'nome': 'Camiseta', 'tamanho': 'M', 'cor': 'Azul', 'quantidade': 10},
    {'nome': 'Calça Jeans', 'tamanho': '42', 'cor': 'Preto', 'quantidade': 5},
    // Adicione mais itens aqui
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 246, 230),
      appBar: AppBar(
        title: const Text('Voxa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddItemDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: roupas.length,
              itemBuilder: (context, index) {
                return RoupaCard(
                  roupa: roupas[index],
                  onIncrement: () {
                    setState(() {
                      roupas[index]['quantidade']++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (roupas[index]['quantidade'] > 0) {
                        roupas[index]['quantidade']--;
                      }
                    });
                  },
                  onDelete: () {
                    setState(() {
                      roupas.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => _showOptionsDialog(context),
            icon: const Icon(Icons.more_horiz),
            label: const Text('Mais Opções'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AddItemDialog(
        onAddItem: (newItem) {
          setState(() {
            roupas.add(newItem);
          });
        },
      ),
    );
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const OptionsDialog(),
    );
  }
}

// Componentes Reutilizáveis

class RoupaCard extends StatelessWidget {
  final Map<String, dynamic> roupa;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;

  const RoupaCard({
    super.key,
    required this.roupa,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(roupa['nome']),
        subtitle: Text(
          'Tamanho: ${roupa['tamanho']}, Cor: ${roupa['cor']}',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: onDecrement,
            ),
            Text(
              '${roupa['quantidade']}',
              style: const TextStyle(fontSize: 16),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: onIncrement,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

class AddItemDialog extends StatelessWidget {
  final Function(Map<String, dynamic>) onAddItem;

  const AddItemDialog({super.key, required this.onAddItem});

  @override
  Widget build(BuildContext context) {
    final nomeController = TextEditingController();
    final tamanhoController = TextEditingController();
    final corController = TextEditingController();

    return AlertDialog(
      title: const Text('Adicionar Roupa'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nomeController,
            decoration: const InputDecoration(labelText: 'Nome'),
          ),
          TextField(
            controller: tamanhoController,
            decoration: const InputDecoration(labelText: 'Tamanho'),
          ),
          TextField(
            controller: corController,
            decoration: const InputDecoration(labelText: 'Cor'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            onAddItem({
              'nome': nomeController.text,
              'tamanho': tamanhoController.text,
              'cor': corController.text,
              'quantidade': 0,
            });
            Navigator.pop(context);
          },
          child: const Text('Adicionar'),
        ),
      ],
    );
  }
}

class OptionsDialog extends StatelessWidget {
  const OptionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Mais Opções'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OptionButton(
            label: 'Tipo de Roupa',
            icon: Icons.category,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Rota.tipo);
            },
          ),
          OptionButton(
            label: 'Tamanho de Roupa',
            icon: Icons.straighten,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Rota.tamanho);
            },
          ),
          OptionButton(
            label: 'Material',
            icon: Icons.texture,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Rota.material);
            },
          ),
          OptionButton(
            label: 'Fornecedor',
            icon: Icons.store,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Rota.tamanho);
            },
          ),
          OptionButton(
            label: 'Marca',
            icon: Icons.branding_watermark,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Rota.marca);
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Fechar'),
        ),
      ],
    );
  }
}

class OptionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const OptionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
