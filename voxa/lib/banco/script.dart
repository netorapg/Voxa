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
  '''
  CREATE TABLE IF NOT EXISTS marcas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
  )
  ''',
  '''
  CREATE TABLE IF NOT EXISTS fornecedores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    razaoSocial TEXT NOT NULL,
    nomeFantasia TEXT NOT NULL,
    cnpj TEXT NOT NULL,
    endereco TEXT NOT NULL,
    telefone TEXT NOT NULL,
    email TEXT NOT NULL
  )
  '''
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
  ('Marisa LTDA', 'Marisa', '12345678901234', 'Rua 1, 123', '123456789', 'marisa@example.com'),
  ('Renner SA', 'Renner', '98765432109876', 'Avenida 2, 456', '987654321', 'renner@example.com'),
  ('C&A Modas', 'C&A', '56789012345678', 'Praça 3, 789', '567890123', 'cea@example.com'),
  ('Zara Brasil', 'Zara', '34567890123456', 'Alameda 4, 101', '345678901', 'zara@example.com'),
  ('Hering S/A', 'Hering', '23456789012345', 'Estrada 5, 112', '234567890', 'hering@example.com');
  '''
];
