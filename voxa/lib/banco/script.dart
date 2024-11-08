const criarTabelas = [
  '''
  CREATE TABLE tamanhos (
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
('48'),
  '''
];
