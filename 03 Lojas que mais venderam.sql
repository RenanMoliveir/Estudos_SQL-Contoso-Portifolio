
USE ContosoRetailDW

/* 01 - VERIFICAR QUANTIDADE DE PRODUTOS/CLEINTES/FORNECEDORES/MARCAS/CORES*/


-- Verificando a quantida de produtos distintos cadastrados
SELECT 
	DISTINCT P.ProductName AS Produto
FROM DimProduct P
-- A consulta retornou 2.517 produtos distintos cadastrados


-- Consultando Clientes
SELECT 
	 DISTINCT C.CustomerKey,
	 C.FirstName,	
	 C.EmailAddress
FROM DimCustomer C
-- A consulta retorna 18.869 clientes e não há registros duplicados


-- Consultando a quantidade de fornecedores
SELECT 
	DISTINCT P.Manufacturer
FROM DimProduct P
-- Consulta retornou 11 fornecedores


-- Consultando a quantidade de cores dos produtos
SELECT
	DISTINCT P.ColorName	
FROM DimProduct P
-- Consulta retornou 16 CORES



/*VERIFICAR QUANTIDADE QUE CADA LOJA VENDEU*/

SELECT TOP 10
	S.StoreKey,	
	ST.StoreName,
	SUM(S.SalesQuantity) AS Quantidade,
	SUM(S.SalesAmount) AS Total
FROM FactSales S
INNER JOIN DimStore AS ST ON S.StoreKey = ST.StoreKey
GROUP BY S.StoreKey, ST.StoreName 
ORDER BY Total ASC
-- Consulta retorna as TOP 10 Lojas que mais venderam, ordenadas de forma ascendente através do seu total

