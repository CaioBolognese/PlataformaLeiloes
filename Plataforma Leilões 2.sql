USE PlataformaLeilao;

INSERT INTO Usuario (UsuarioID, Nome, Email, Endereco, TipoUsuario) VALUES
(1, 'João Silva', 'joao@exemplo.com', 'Rua A, 123, Manaus, AM, 69000-000', 'comprador'),
(2, 'Maria Oliveira', 'maria@exemplo.com', 'Av. B, 456, Manaus, AM, 69000-000', 'vendedor'),
(3, 'Carlos Santos', 'carlos@exemplo.com', 'Rua C, 789, Manaus, AM, 69000-000', 'comprador'),
(4, 'Ana Lima', 'ana@exemplo.com', 'Rua D, 234, Manaus, AM, 69000-000', 'comprador'),
(5, 'Pedro Souza', 'pedro@exemplo.com', 'Av. E, 567, Manaus, AM, 69000-000', 'vendedor'),
(6, 'Lucas Pereira', 'lucas@exemplo.com', 'Rua F, 890, Manaus, AM, 69000-000', 'comprador'),
(7, 'Carla Martins', 'carla@exemplo.com', 'Av. G, 101, Manaus, AM, 69000-000', 'vendedor'),
(8, 'Fernanda Costa', 'fernanda@exemplo.com', 'Rua H, 112, Manaus, AM, 69000-000', 'comprador');


INSERT INTO Vendedor (VendedorID, CNPJ) VALUES
(2, '12.345.678/0001-99'),
(5, '23.456.789/0001-11'),
(7, '34.567.890/0001-22');


INSERT INTO Comprador (CompradorID, CPF) VALUES
(1, '123.456.789-00'),
(3, '987.654.321-00'),
(4, '234.567.890-01'),
(6, '345.678.901-02'),
(8, '456.789.012-03');

INSERT INTO Cartao (CartaoID, Tipo, Numero, Bandeira, CodigoSeguranca, DataValidade, EnderecoCobranca, NomeNoCartao, CompradorID) VALUES
(1, 'credito', '4111111111111111', 'Visa', '123', '2025-12-31', 'Rua A, 123, Manaus, AM, 69000-000', 'João Silva', 1),
(2, 'debito', '4222222222222222', 'MasterCard', '456', '2024-11-30', 'Rua C, 789, Manaus, AM, 69000-000', 'Carlos Santos', 3),
(3, 'credito', '4333333333333333', 'Amex', '789', '2026-10-31', 'Rua D, 234, Manaus, AM, 69000-000', 'Ana Lima', 4),
(4, 'debito', '4444444444444444', 'Visa', '012', '2025-09-30', 'Rua F, 890, Manaus, AM, 69000-000', 'Lucas Pereira', 6),
(5, 'credito', '4555555555555555', 'MasterCard', '345', '2026-07-31', 'Rua H, 112, Manaus, AM, 69000-000', 'Fernanda Costa', 8);


INSERT INTO Leilao (LeilaoID, Titulo, Descricao, Categoria, PrecoInicial, PrazoInicio, PrazoTermino, CondicoesEnvio, IncrementoMinimo, VendedorID) VALUES
(1, 'Smartphone Samsung Galaxy S24', 'Smartphone Samsung Galaxy S24 creme, novo, com garantia de 1 ano', 'telefone celular', 5200.00, '2024-10-20', '2024-10-31', 'Frete grátis para todo o Brasil', 10.00, 2),
(2, 'Notebook Dell Inspiron', 'Notebook Dell Inspiron 15, 8GB RAM, 256GB SSD, novo', 'computadores', 3500.00, '2024-11-01', '2024-11-15', 'Frete grátis para todo o Brasil', 20.00, 5),
(3, 'Câmera Canon EOS R5', 'Câmera Canon EOS R5, 45MP, gravação 8K, nova', 'câmeras', 12000.00, '2024-12-01', '2024-12-10', 'Frete grátis para todo o Brasil', 50.00, 7);


INSERT INTO Produto (ProdutoID, NomeProduto, Descricao, Categoria, LeilaoID) VALUES
(1, 'Samsung Galaxy S24', 'Smartphone Samsung Galaxy S24 creme, novo, com garantia de 1 ano', 'telefone celular', 1),
(2, 'Dell Inspiron 15', 'Notebook Dell Inspiron 15, 8GB RAM, 256GB SSD, novo', 'computadores', 2),
(3, 'Canon EOS R5', 'Câmera Canon EOS R5, 45MP, gravação 8K, nova', 'câmeras', 3);


INSERT INTO Lance (LanceID, ValorLance, DataLance, TipoLance, CompradorID, LeilaoID) VALUES
(1, 5300.00, '2024-10-21 10:00:00', 'manual', 1, 1),
(2, 5400.00, '2024-10-22 11:00:00', 'manual', 3, 1),
(3, 3550.00, '2024-11-02 14:00:00', 'automatico', 4, 2),
(4, 3600.00, '2024-11-03 16:00:00', 'automatico', 6, 2),
(5, 12500.00, '2024-12-02 09:00:00', 'manual', 8, 3);


INSERT INTO Avaliacao (AvaliacaoID, Nota, Justificativa, LeilaoID, AvaliadorID, AvaliadoID) VALUES
(1, 5, 'Produto em excelente estado e entrega rápida.', 1, 1, 2),
(2, 4, 'Bom comprador, pagamento rápido.', 1, 2, 1),
(3, 5, 'Produto de excelente qualidade!', 2, 4, 5),
(4, 4, 'Vendedor confiável e rápido.', 2, 6, 5),
(5, 5, 'Excelente comunicação e entrega.', 3, 8, 7);

INSERT INTO Favorito (FavoritoID, CompradorID, ProdutoID) VALUES
(1, 1, 1),
(2, 3, 1),
(3, 4, 2),
(4, 6, 3),
(5, 8, 3);

