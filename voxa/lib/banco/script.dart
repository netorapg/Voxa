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
'''
];
