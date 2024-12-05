USE plataformaleilao;

-- Questão 1 

SELECT 
    L.LanceID,
    L.ValorLance,
    L.DataLance,
    L.TipoLance,
    L.CompradorID,
    U.Nome AS NomeComprador,
    L.LeilaoID,
    LE.Titulo AS TituloLeilao
FROM 
    Lance AS L
JOIN 
    Usuario AS U ON L.CompradorID = U.UsuarioID
JOIN 
    Leilao AS LE ON L.LeilaoID = LE.LeilaoID
WHERE 
    L.CompradorID = 1
AND 
    L.LeilaoID = 1
ORDER BY 
    L.DataLance;
    
-- Questão 2 

SELECT 
    LE.LeilaoID,
    LE.Titulo,
    LE.Descricao,
    LE.Categoria,
    LE.PrecoInicial,
    LE.PrazoInicio,
    LE.PrazoTermino,
    LE.CondicoesEnvio,
    LE.IncrementoMinimo,
    DATEDIFF(LE.PrazoTermino, CURDATE()) AS PrazoRestante
FROM 
    Leilao AS LE
WHERE 
    LE.Categoria = 'computadores'  -- Categoria desejada
ORDER BY 
    PrazoRestante;

-- Questão 3 

SELECT 
    L.LanceID,
    L.ValorLance,
    L.DataLance,
    L.TipoLance,
    L.CompradorID,
    U.Nome AS NomeComprador,
    L.LeilaoID,
    LE.Titulo AS TituloLeilao,
    P.NomeProduto AS NomeProduto
FROM 
    Lance AS L
JOIN 
    Usuario AS  U ON L.CompradorID = U.UsuarioID
JOIN 
    Leilao AS LE ON L.LeilaoID = LE.LeilaoID
JOIN 
    Produto AS AP ON LE.LeilaoID = P.LeilaoID
WHERE 
    P.ProdutoID = 1
ORDER BY 
    L.DataLance DESC;
    
    -- Questão 4
    
SELECT 
    P.ProdutoID,
    P.NomeProduto,
    P.Descricao,
    P.Categoria,
    COUNT(L.LanceID) AS NumeroDeLances
FROM 
    Produto P
JOIN 
    Leilao AS LE ON P.LeilaoID = LE.LeilaoID
JOIN 
    Lance AS L ON L.LeilaoID = LE.LeilaoID
WHERE 
    L.DataLance BETWEEN '2024-10-01' AND '2024-12-31'
GROUP BY 
    P.ProdutoID, P.NomeProduto, P.Descricao, P.Categoria
ORDER BY 
    NumeroDeLances DESC;
    
-- Questão 5 

SELECT 
    U.UsuarioID,
    U.Nome AS NomeVendedor,
    AVG(A.Nota) AS MediaAvaliacao,
    COUNT(A.AvaliacaoID) AS NumeroAvaliacoes
FROM 
    Avaliacao AS A
JOIN 
    Usuario as U ON A.AvaliadoID = U.UsuarioID
WHERE 
    U.TipoUsuario = 'vendedor'
GROUP BY 
    U.UsuarioID, U.Nome
HAVING 
    COUNT(A.AvaliacaoID) > 0
ORDER BY 
    MediaAvaliacao DESC, NumeroAvaliacoes DESC;
    





