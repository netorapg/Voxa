import 'package:flutter/material.dart';
import 'package:voxa/widget/rota.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Estoque extends StatefulWidget {
  const Estoque({super.key});

  @override
  State<Estoque> createState() => _EstoqueState();
}

class _EstoqueState extends State<Estoque> {
  final List<Map<String, dynamic>> roupas = [
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              roupa['nome'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      roupa['imagem'] != null
                          ? Image.file(
                              File(roupa['imagem']),
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            )
                          : const SizedBox(),
                      Text('Tamanho: ${roupa['tamanho']}'),
                      Text('Material: ${roupa['material']}'),
                      Text('Marca: ${roupa['marca']}'),
                      Text('Fornecedor: ${roupa['fornecedor']}'),
                      Row(
                        children: [
                          const Text('Cor: '),
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
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
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
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: onDelete,
                          color: Colors.red,
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Implementar edição
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
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
  String? selectedMaterial;
  String? selectedMarca;
  String? selectedFornecedor;
  Color selectedColor = Colors.blue;
  File? _image;

  final ImagePicker _picker = ImagePicker();

  // Exemplos de tipos e tamanhos, substitua pelos dados do seu banco
  final List<String> tipos = [
    'Camiseta',
    'Calça',
    'Jaqueta'
  ]; // Exemplo de tipos
  final List<String> tamanhos = ['P', 'M', 'G', 'GG']; // Exemplo de tamanhos
  final List<String> materiais = [
    'Algodão',
    'Poliéster',
    'Lã',
    'Seda'
  ]; // Exemplo de materiais
  final List<String> marcas = [
    'Nike',
    'Adidas',
    'Puma',
    'Fila'
  ]; // Exemplo de marcas
  final List<String> fornecedores = [
    'Fornecedor 1',
    'Fornecedor 2',
    'Fornecedor 3'
  ]; // Exemplo de fornecedores

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

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

            // Dropdown para Material
            DropdownButton<String>(
              value: selectedMaterial,
              hint: const Text('Selecione o material'),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMaterial = newValue;
                });
              },
              items: materiais.map<DropdownMenuItem<String>>((String material) {
                return DropdownMenuItem<String>(
                  value: material,
                  child: Text(material),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),

            // Dropdown para Marca
            DropdownButton<String>(
              value: selectedMarca,
              hint: const Text('Selecione a marca'),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMarca = newValue;
                });
              },
              items: marcas.map<DropdownMenuItem<String>>((String marca) {
                return DropdownMenuItem<String>(
                  value: marca,
                  child: Text(marca),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),

            // Dropdown para Fornecedor
            DropdownButton<String>(
              value: selectedFornecedor,
              hint: const Text('Selecione o fornecedor'),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedFornecedor = newValue;
                });
              },
              items: fornecedores
                  .map<DropdownMenuItem<String>>((String fornecedor) {
                return DropdownMenuItem<String>(
                  value: fornecedor,
                  child: Text(fornecedor),
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
            const SizedBox(height: 10),

            // Botão para tirar foto
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Tirar Foto'),
            ),
            const SizedBox(height: 10),

            // Exibir imagem selecionada
            _image != null
                ? Image.file(
                    _image!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                : const Text('Nenhuma imagem selecionada'),
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
              'material': selectedMaterial ?? '',
              'marca': selectedMarca ?? '',
              'fornecedor': selectedFornecedor ?? '',
              'cor': selectedColor,
              'quantidade': 0,
              'imagem': _image?.path,
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
