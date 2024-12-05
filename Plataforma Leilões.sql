CREATE DATABASE IF NOT EXISTS PlataformaLeilao;

USE PlataformaLeilao;

-- Tabela Usuário
CREATE TABLE Usuario (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Endereco VARCHAR(255) NOT NULL,
    TipoUsuario ENUM('comprador', 'vendedor') NOT NULL
);

-- Tabela Vendedor (especialização de Usuário)
CREATE TABLE Vendedor (
    VendedorID INT PRIMARY KEY,
    CNPJ VARCHAR(20) NOT NULL,
    FOREIGN KEY (VendedorID) REFERENCES Usuario(UsuarioID)
);

-- Tabela Comprador (especialização de Usuário)
CREATE TABLE Comprador (
    CompradorID INT PRIMARY KEY,
    CPF VARCHAR(15) NOT NULL,
    FOREIGN KEY (CompradorID) REFERENCES Usuario(UsuarioID)
);

-- Tabela Cartão
CREATE TABLE Cartao (
    CartaoID INT AUTO_INCREMENT PRIMARY KEY,
    Tipo ENUM('credito', 'debito') NOT NULL,
    Numero VARCHAR(16) NOT NULL,
    Bandeira VARCHAR(20) NOT NULL,
    CodigoSeguranca VARCHAR(3) NOT NULL,
    DataValidade DATE NOT NULL,
    EnderecoCobranca VARCHAR(255) NOT NULL,
    NomeNoCartao VARCHAR(100) NOT NULL,
    CompradorID INT NOT NULL,
    FOREIGN KEY (CompradorID) REFERENCES Comprador(CompradorID)
);

-- Tabela Leilão
CREATE TABLE Leilao (
    LeilaoID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Descricao TEXT NOT NULL,
    Categoria VARCHAR(100) NOT NULL,
    PrecoInicial DECIMAL(10, 2) NOT NULL,
    PrazoInicio DATE NOT NULL,
    PrazoTermino DATE NOT NULL,
    CondicoesEnvio TEXT NOT NULL,
    IncrementoMinimo DECIMAL(10, 2) NOT NULL,
    VendedorID INT NOT NULL,
    FOREIGN KEY (VendedorID) REFERENCES Vendedor(VendedorID)
);

-- Tabela Produto
CREATE TABLE Produto (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    NomeProduto VARCHAR(100) NOT NULL,
    Descricao TEXT NOT NULL,
    Categoria VARCHAR(100) NOT NULL,
    LeilaoID INT NOT NULL,
    FOREIGN KEY (LeilaoID) REFERENCES Leilao(LeilaoID)
);

-- Tabela Lance
CREATE TABLE Lance (
    LanceID INT AUTO_INCREMENT PRIMARY KEY,
    ValorLance DECIMAL(10, 2) NOT NULL,
    DataLance DATETIME NOT NULL,
    TipoLance ENUM('manual', 'automatico') NOT NULL,
    CompradorID INT NOT NULL,
    LeilaoID INT NOT NULL,
    FOREIGN KEY (CompradorID) REFERENCES Comprador(CompradorID),
    FOREIGN KEY (LeilaoID) REFERENCES Leilao(LeilaoID)
);

-- Tabela Avaliação
CREATE TABLE Avaliacao (
    AvaliacaoID INT AUTO_INCREMENT PRIMARY KEY,
    Nota INT NOT NULL CHECK (Nota >= 1 AND Nota <= 5),
    Justificativa TEXT,
    LeilaoID INT NOT NULL,
    AvaliadorID INT NOT NULL,
    AvaliadoID INT NOT NULL,
    FOREIGN KEY (LeilaoID) REFERENCES Leilao(LeilaoID),
    FOREIGN KEY (AvaliadorID) REFERENCES Usuario(UsuarioID),
    FOREIGN KEY (AvaliadoID) REFERENCES Usuario(UsuarioID)
);

-- Tabela Favorito
CREATE TABLE Favorito (
    FavoritoID INT AUTO_INCREMENT PRIMARY KEY,
    CompradorID INT NOT NULL,
    ProdutoID INT NOT NULL,
    FOREIGN KEY (CompradorID) REFERENCES Comprador(CompradorID),
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);







