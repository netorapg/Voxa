import 'package:flutter/material.dart';
import 'package:voxa/widget/rota.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Estoque extends StatefulWidget {
  const Estoque({super.key});

  @override
  State<Estoque> createState() => _EstoqueState();
}

class _EstoqueState extends State<Estoque> {
  final List<Map<String, dynamic>> roupas = [
    {'nome': 'Camiseta', 'tamanho': 'M', 'cor': Colors.blue, 'quantidade': 10},
    {'nome': 'Calça Jeans', 'tamanho': '42', 'cor': Colors.black, 'quantidade': 5},
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
        subtitle: Row(
          children: [
            Text('Tamanho: ${roupa['tamanho']}, Cor: '),
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: roupa['cor'],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1),
              ),
            ),
          ],
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

class AddItemDialog extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddItem;

  const AddItemDialog({super.key, required this.onAddItem});

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  String? selectedTipo;
  String? selectedTamanho;
  Color selectedColor = Colors.blue;

  // Exemplos de tipos e tamanhos, substitua pelos dados do seu banco
  final List<String> tipos = ['Camiseta', 'Calça', 'Jaqueta']; // Exemplo de tipos
  final List<String> tamanhos = ['P', 'M', 'G', 'GG']; // Exemplo de tamanhos

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Roupa'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Dropdown para Tipo
            DropdownButton<String>(
              value: selectedTipo,
              hint: const Text('Selecione o tipo'),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTipo = newValue;
                });
              },
              items: tipos.map<DropdownMenuItem<String>>((String tipo) {
                return DropdownMenuItem<String>(
                  value: tipo,
                  child: Text(tipo),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),

            // Dropdown para Tamanho
            DropdownButton<String>(
              value: selectedTamanho,
              hint: const Text('Selecione o tamanho'),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTamanho = newValue;
                });
              },
              items: tamanhos.map<DropdownMenuItem<String>>((String tamanho) {
                return DropdownMenuItem<String>(
                  value: tamanho,
                  child: Text(tamanho),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),

            // Seletor de cor
            Row(
              children: [
                const Text('Cor:'),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _showColorPicker(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: selectedColor,
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            widget.onAddItem({
              'nome': selectedTipo ?? '',
              'tamanho': selectedTamanho ?? '',
              'cor': selectedColor,
              'quantidade': 0,
            });
            Navigator.pop(context);
          },
          child: const Text('Adicionar'),
        ),
      ],
    );
  }

  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Selecione uma cor'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: selectedColor,
            onColorChanged: (color) {
              setState(() {
                selectedColor = color;
              });
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
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
              Navigator.pushNamed(context, Rota.fornecedor);
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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}