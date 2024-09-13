const criarTabelas = [
  '''
  CREATE TABLE item (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo TEXT NOT NULL,
    tamanhos TEXT NOT NULL,
    cor TEXT NOT NULL,
    marca TEXT NOT NULL,
    material TEXT NOT NULL,
    quantidadeEmEstoque INTEGER NOT NULL,
    fornecedor TEXT NOT NULL,
    imagem TEXT NOT NULL
  )
  '''
];

const inserirRegistros = [
  '''
INSERT INTO item (tipo, tamanhos, cor, marca, material, quantidadeEmEstoque, fornecedor, imagem) VALUES
('Camiseta', 'P, M, G', 'Branca', 'Nike', 'Algodão', 10, 'Fornecedor 1', 'assets/images/camiseta1.jpg'),
('Calça', '38, 40, 42', 'Preta', 'Adidas', 'Jeans', 5, 'Fornecedor 2', 'assets/images/calca1.jpg'),
('Tênis', '38, 40, 42', 'Branco', 'Puma', 'Couro', 3, 'Fornecedor 3', 'assets/images/tenis1.jpg'),
('Boné', 'Único', 'Preto', 'Nike', 'Algodão', 15, 'Fornecedor 4', 'assets/images/bone1.jpg')
  '''
];