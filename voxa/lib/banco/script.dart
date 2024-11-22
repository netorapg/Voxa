const criarTabelas = [
  '''
  CREATE TABLE IF NOT EXISTS tamanhos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
  )
  ''',
  '''
  CREATE TABLE IF NOT EXISTS tipos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
  )
  ''',
  '''
  CREATE TABLE IF NOT EXISTS materiais (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
  )
  ''',
];

const inserirRegistros = [
  '''
INSERT INTO tamanhos (nome) VALUES
('P'),
('M'),
('G'),
('GG'),
('XGG'),
('48');
  ''',
  '''
INSERT INTO tipos (nome) VALUES
('Camiseta'),
('Calça'),
('Bermuda'),
('Blusa'),
('Vestido');
''',
'''
INSERT INTO materiais (nome) VALUES
('Algodão'),
('Poliéster'),
('Lã'),
('Seda'),
('Jeans');
''',

'''
INSERT INTO marcas (nome) VALUES
('Marisa'),
('Renner'),
('C&A'),
('Zara'),
('Hering');
''',

'''
INSERT INTO fornecedores (razaoSocial, nomeFantasia, cnpj, endereco, telefone, email) VALUES
('Marisa', 'Marisa', '12345678901234', 'Rua 1, 123', '123456789', 'marisa@example.com'),

''',

];
