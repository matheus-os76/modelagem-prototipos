/* Modelagem Lógica: */

/* Criação das Tabelas */
CREATE TABLE Pedidos (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    id_vendedor INTEGER,
    id_forma_pagamento INTEGER,
    status VARCHAR(25),
    data_criacao DATE,
    data_entrega DATE,
    valor_frete DECIMAL,
    valor_desconto DECIMAL,
    total DECIMAL,
    observacao VARCHAR(150)
);

CREATE TABLE Clientes (
    id_cliente INTEGER PRIMARY KEY,
    id_endereco INTEGER,
    nome VARCHAR(50)
);

CREATE TABLE Enderecos (
    id_endereco INTEGER PRIMARY KEY,
    logradouro VARCHAR(100),
    complemento VARCHAR(50),
    estado VARCHAR(25),
    numero VARCHAR(10),
    cidade VARCHAR(50),
    cep VARCHAR(8) UNIQUE
);

CREATE TABLE Vendedores (
    id_vendedor INTEGER PRIMARY KEY,
    id_endereco INTEGER,
    nome VARCHAR(50)
);

CREATE TABLE Formas_Pagamento (
    id_forma INTEGER PRIMARY KEY,
    forma_pagamento VARCHAR(50)
);

CREATE TABLE Produtos (
    id_produto INTEGER PRIMARY KEY,
    nome_produto VARCHAR(50),
    preco DECIMAL,
    estoque INTEGER
);

CREATE TABLE PedidoProduto (
    id_pedprod INTEGER PRIMARY KEY,
    id_pedido INTEGER,
    id_produto INTEGER,
    quantidade INTEGER,
    subtotal DECIMAL
);

/* Adição das Chaves Estrangeiras nas Tabelas */
ALTER TABLE Pedidos ADD CONSTRAINT FK_pedido_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES Clientes (id_cliente);
 
ALTER TABLE Pedidos ADD CONSTRAINT FK_pedido_vendedor
    FOREIGN KEY (id_vendedor)
    REFERENCES Vendedores (id_vendedor);
 
ALTER TABLE Pedidos ADD CONSTRAINT FK_pedido_forma
    FOREIGN KEY (id_forma_pagamento)
    REFERENCES Formas_Pagamento (id_forma);
 
ALTER TABLE Clientes ADD CONSTRAINT FK_cliente_endereco
    FOREIGN KEY (id_endereco)
    REFERENCES Enderecos (id_endereco);
 
ALTER TABLE Vendedores ADD CONSTRAINT FK_vendedor_endereco
    FOREIGN KEY (id_endereco)
    REFERENCES Enderecos (id_endereco);
 
ALTER TABLE PedidoProduto ADD CONSTRAINT FK_pedprod_pedido
    FOREIGN KEY (id_pedido)
    REFERENCES Pedidos (id_pedido);
 
ALTER TABLE PedidoProduto ADD CONSTRAINT FK_pedprod_produto
    FOREIGN KEY (id_produto)
    REFERENCES Produtos (id_produto);

/* Inserções de Dados dentro das Tabelas */
INSERT INTO Enderecos(id_endereco, logradouro, complemento, estado, numero, cidade, cep) VALUES (1, 'Rua Almeida Do Alamo', 'Do lado do hospital', 'SP', '128', 'São Paulo', '12345678');
INSERT INTO Enderecos(id_endereco, logradouro, complemento, estado, numero, cidade, cep) VALUES (2, 'Rua Cordeiro Sagrado', 'Em frente a Igreja', 'MG', '12', 'Belo Horizonte', '87654321');
INSERT INTO Enderecos(id_endereco, logradouro, complemento, estado, numero, cidade, cep) VALUES (3, 'Avenida Comércio Corcovado', 'Andar 11', 'RJ', '288', 'Rio de Janeiro', '97531246');
INSERT INTO Enderecos(id_endereco, logradouro, complemento, estado, numero, cidade, cep) VALUES (4, 'Rua Avenida do Distrito', 'Bloco 4, Andar 8', 'SP', '79', 'Santo André', '10234986');

INSERT INTO Clientes(id_cliente, id_endereco, nome) VALUES (10, 1, 'José Oliveira');
INSERT INTO Clientes(id_cliente, id_endereco, nome) VALUES (11, 2, 'Maria Yasmin');

INSERT INTO Vendedores(id_vendedor, id_endereco, nome) VALUES (20, 4, 'Gustavo Costas Pereira');
INSERT INTO Vendedores(id_vendedor, id_endereco, nome) VALUES (21, 3, 'Matias Silva');

INSERT INTO Produtos(id_produto, nome_produto, preco, estoque) VALUES (40, 'Mesa Eletrica', 850.50, 4);
INSERT INTO Produtos(id_produto, nome_produto, preco, estoque) VALUES (41, 'Shampoo Anti-Cabelo', 23.95, 11);
INSERT INTO Produtos(id_produto, nome_produto, preco, estoque) VALUES (42, 'Pincel Arco-Iris', 6.00, 23);
INSERT INTO Produtos(id_produto, nome_produto, preco, estoque) VALUES (43, 'Computador Quebrado Funcional', 1245, 2);
INSERT INTO Produtos(id_produto, nome_produto, preco, estoque) VALUES (44, 'Suco Guaraná sabor Tangerina', 5.50, 23);
INSERT INTO Produtos(id_produto, nome_produto, preco, estoque) VALUES (45, 'Água 2 Litros', 4.90, 19);